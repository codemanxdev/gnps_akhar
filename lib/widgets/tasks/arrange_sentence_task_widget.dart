import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';
import '../common/task_speaker_button.dart';
import '../common/task_check_button.dart';
import '../common/task_header.dart';
import '../common/task_bank_tile.dart';
import '../common/task_built_tile.dart';
import '../common/task_build_area.dart';
import '../common/task_result_preview.dart';

class ArrangeSentenceTaskWidget extends ConsumerStatefulWidget {
  final Task task;
  final VoidCallback onComplete;
  final VoidCallback? onIncorrect;

  const ArrangeSentenceTaskWidget({
    super.key,
    required this.task,
    required this.onComplete,
    this.onIncorrect,
  });

  @override
  ConsumerState<ArrangeSentenceTaskWidget> createState() =>
      _ArrangeSentenceTaskWidgetState();
}

class _ArrangeSentenceTaskWidgetState
    extends ConsumerState<ArrangeSentenceTaskWidget>
    with SingleTickerProviderStateMixin {
  late List<_WordTile> _bankTiles;
  final List<_WordTile> _builtTiles = [];
  bool? _lastCheckCorrect;

  late final AnimationController _shakeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void initState() {
    super.initState();
    final words = List<String>.from(widget.task.content['words'] as List);
    _bankTiles = [
      for (int i = 0; i < words.length; i++)
        _WordTile(originalIndex: i, text: words[i]),
    ]..shuffle(Random());
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _moveToBuilt(_WordTile tile) {
    setState(() {
      _bankTiles.remove(tile);
      _builtTiles.add(tile);
      _lastCheckCorrect = null;
    });
  }

  void _moveToBank(_WordTile tile) {
    setState(() {
      _builtTiles.remove(tile);
      _bankTiles.add(tile);
      _lastCheckCorrect = null;
    });
  }

  void _check() {
    final correctOrder = List<int>.from(
      widget.task.content['correctOrder'] as List,
    );
    final builtOrder = _builtTiles.map((t) => t.originalIndex).toList();
    final isCorrect =
        builtOrder.length == correctOrder.length &&
        List.generate(
          builtOrder.length,
          (i) => builtOrder[i] == correctOrder[i],
        ).every((b) => b);

    setState(() => _lastCheckCorrect = isCorrect);
    if (isCorrect) {
      Future.delayed(const Duration(milliseconds: 600), widget.onComplete);
    } else {
      _shakeController.forward(from: 0.0);
      widget.onIncorrect?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullSentence = (List<String>.from(
      widget.task.content['words'] as List,
    )).join(' ');
    final builtSentence = _builtTiles.map((t) => t.text).join(' ');

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TaskSpeakerButton(textToSpeak: fullSentence),
              const SizedBox(width: 12),
              const TaskHeader(title: 'Arrange the sentence'),
            ],
          ),
          const SizedBox(height: 24),

          // Sentence Preview
          if (_builtTiles.isNotEmpty)
            TaskResultPreview(
              text: builtSentence,
              isCorrect: _lastCheckCorrect,
            ),

          const SizedBox(height: 24),

          DragTarget<_WordTile>(
            onAcceptWithDetails: (details) => _moveToBuilt(details.data),
            builder: (context, candidateData, rejectedData) {
              return TaskBuildArea(
                isCorrect: _lastCheckCorrect,
                shakeController: _shakeController,
                hintText: 'Drag words here in order',
                children: _builtTiles
                    .map(
                      (t) => TaskBuiltTile(
                        text: t.text,
                        fontSize: 24,
                        onTap: () => _moveToBank(t),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 32),

          // Word bank
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _bankTiles
                .map(
                  (t) => TaskBankTile(
                    text: t.text,
                    data: t,
                    onTap: () => _moveToBuilt(t),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          TaskCheckButton(onPressed: _builtTiles.isEmpty ? null : _check),
        ],
      ),
    );
  }
}

class _WordTile {
  final int originalIndex;
  final String text;

  _WordTile({required this.originalIndex, required this.text});
}
