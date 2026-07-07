import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';
import '../common/task_speaker_button.dart';
import '../common/task_check_button.dart';
import '../common/task_header.dart';
import '../common/task_bank_tile.dart';
import '../common/task_built_tile.dart';
import '../common/task_build_area.dart';
import '../common/task_result_preview.dart';

/// Presents an image + word bank; the child drags letter/syllable tiles
/// from the bank into a build area to spell the target word. The bank
/// includes distractor tiles that don't belong in the answer.
class SpellingTaskWidget extends ConsumerStatefulWidget {
  final Task task;
  final VoidCallback onComplete;

  const SpellingTaskWidget({super.key, required this.task, required this.onComplete});

  @override
  ConsumerState<SpellingTaskWidget> createState() => _SpellingTaskWidgetState();
}

class _SpellingTaskWidgetState extends ConsumerState<SpellingTaskWidget>
    with SingleTickerProviderStateMixin {
  late List<_Tile> _bankTiles;
  final List<_Tile> _builtTiles = [];
  bool? _lastCheckCorrect;

  late final AnimationController _shakeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void initState() {
    super.initState();
    final letterBank =
        List<String>.from(widget.task.content['letterBank'] as List);
    _bankTiles = [
      for (int i = 0; i < letterBank.length; i++)
        _Tile(id: i, text: letterBank[i]),
    ]..shuffle(Random());
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _moveToBuilt(_Tile tile) {
    setState(() {
      _bankTiles.remove(tile);
      _builtTiles.add(tile);
      _lastCheckCorrect = null;
    });
  }

  void _moveToBank(_Tile tile) {
    setState(() {
      _builtTiles.remove(tile);
      _bankTiles.add(tile);
      _lastCheckCorrect = null;
    });
  }

  void _check() {
    final targetWord = widget.task.content['targetWord'] as String;
    final built = _builtTiles.map((t) => t.text).join();
    final isCorrect = built == targetWord;
    setState(() => _lastCheckCorrect = isCorrect);

    if (isCorrect) {
      Future.delayed(const Duration(milliseconds: 600), widget.onComplete);
    } else {
      HapticFeedback.heavyImpact();
      _shakeController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.task.content['imageUrl'] as String;
    final targetWord = widget.task.content['targetWord'] as String;
    final builtWord = _builtTiles.map((t) => t.text).join();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const TaskHeader(title: 'Spell the word'),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imageUrl, fit: BoxFit.cover, errorBuilder:
                  (_, _, _) => const Icon(Icons.image_not_supported, size: 64)),
            ),
          ),
          const SizedBox(height: 12),
          TaskSpeakerButton(textToSpeak: targetWord),
          const SizedBox(height: 20),
          
          // Resulting Word Preview (This makes matras look correct)
          if (_builtTiles.isNotEmpty)
            TaskResultPreview(
              text: builtWord,
              isCorrect: _lastCheckCorrect,
              fontSize: 40,
            ),
          
          const SizedBox(height: 24),
          
          // Build Area (Slots)
          DragTarget<_Tile>(
            onAcceptWithDetails: (details) => _moveToBuilt(details.data),
            builder: (context, candidateData, rejectedData) {
              return TaskBuildArea(
                isCorrect: _lastCheckCorrect,
                shakeController: _shakeController,
                hintText: 'Drag letters here',
                children: _builtTiles.map((t) => TaskBuiltTile(
                  text: t.text,
                  onTap: () => _moveToBank(t),
                )).toList(),
              );
            },
          ),
          
          const SizedBox(height: 32),
          
          // Letter bank
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _bankTiles.map((t) => TaskBankTile(
              text: t.text,
              data: t,
              onTap: () => _moveToBuilt(t),
            )).toList(),
          ),
          const Spacer(),
          TaskCheckButton(
            onPressed: _builtTiles.isEmpty ? null : _check,
          ),
        ],
      ),
    );
  }
}

class _Tile {
  final int id;
  final String text;
  _Tile({required this.id, required this.text});
}
