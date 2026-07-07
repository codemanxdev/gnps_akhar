import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';
import '../common/task_speaker_button.dart';
import '../common/task_header.dart';
import '../common/task_bank_tile.dart';
import '../common/task_built_tile.dart';
import '../common/task_build_area.dart';

class FillInBlankTaskWidget extends ConsumerStatefulWidget {
  final Task task;
  final VoidCallback onComplete;

  const FillInBlankTaskWidget({super.key, required this.task, required this.onComplete});

  @override
  ConsumerState<FillInBlankTaskWidget> createState() => _FillInBlankTaskWidgetState();
}

class _FillInBlankTaskWidgetState extends ConsumerState<FillInBlankTaskWidget>
    with SingleTickerProviderStateMixin {
  String? _selected;
  bool? _isCorrect;

  late final AnimationController _shakeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _select(String option) {
    final correctWord = widget.task.content['correctWord'] as String;
    setState(() {
      _selected = option;
      _isCorrect = option == correctWord;
    });
    if (option == correctWord) {
      Future.delayed(const Duration(milliseconds: 600), widget.onComplete);
    } else {
      HapticFeedback.heavyImpact();
      _shakeController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final parts =
        List<String>.from(widget.task.content['sentenceParts'] as List);
    final options = List<String>.from(widget.task.content['options'] as List);
    final correctWord = widget.task.content['correctWord'] as String;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const TaskHeader(title: 'Fill in the blank'),
          const SizedBox(height: 32),
          TaskSpeakerButton(
            textToSpeak:
                parts.map((p) => p == '___' ? correctWord : p).join(' '),
          ),
          const SizedBox(height: 24),
          TaskBuildArea(
            isCorrect: _isCorrect,
            shakeController: _shakeController,
            hintText: '',
            children: parts.map((p) {
              final isBlank = p == '___';
              return TaskBuiltTile(
                text: isBlank ? (_selected ?? '___') : p,
                onTap: () {
                  if (isBlank) setState(() => _selected = null);
                },
                color: isBlank ? Colors.blue : Colors.black87,
                fontSize: 24,
              );
            }).toList(),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: options.map((option) {
              return TaskBankTile(
                text: option,
                onTap: () => _select(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
