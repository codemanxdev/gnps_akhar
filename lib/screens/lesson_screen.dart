import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/reward_config.dart';
import '../models/journey.dart';
import '../models/lesson.dart';
import '../models/task.dart';
import '../providers.dart';
import '../widgets/journey/current_lesson_banner.dart';
import '../widgets/journey/reward_burst_overlay.dart';
import '../widgets/tasks/arrange_sentence_task_widget.dart';
import '../widgets/tasks/fill_in_blank_task_widget.dart';
import '../widgets/tasks/spelling_task_widget.dart';
import '../widgets/tasks/trace_task_widget.dart';
import '../widgets/tasks/word_selection_task_widget.dart';

class LessonScreen extends ConsumerStatefulWidget {
  final Lesson lesson;
  final Journey journey;

  const LessonScreen({super.key, required this.lesson, required this.journey});

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> {
  int _taskIndex = 0;
  int _pointsEarned = 0;
  bool _showingSuccess = false;

  final GlobalKey _starIconKey = GlobalKey();

  void _onTaskComplete(Task task) async {
    _pointsEarned += task.pointsAwarded;

    ref.read(audioServiceProvider).playSuccess();

    setState(() => _showingSuccess = true);
    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;
    setState(() => _showingSuccess = false);

    final isLastTask = _taskIndex + 1 >= widget.lesson.tasks.length;

    if (!isLastTask) {
      setState(() => _taskIndex++);
      return;
    }

    // Lesson complete: burst reward icons from the center of the screen
    // toward the banner's points chip, then commit progress once they've
    // landed — so the points counter's count-up animation starts right
    // as the icons arrive.
    final screenSize = MediaQuery.sizeOf(context);
    final origin = Offset(screenSize.width / 2, screenSize.height / 2);

    await showRewardBurst(
      context: context,
      origin: origin,
      targetKey: _starIconKey,
      icon: RewardConfig.icon,
      color: RewardConfig.color,
      count: (_pointsEarned / 5).clamp(4, 12).round(),
    );

    if (!mounted) return;

    await ref
        .read(progressProvider.notifier)
        .completeLesson(widget.journey, widget.lesson.id, _pointsEarned);
    if (mounted) _showCompletionDialog();
  }

  void _onTaskIncorrect() {
    HapticFeedback.heavyImpact();
    ref.read(audioServiceProvider).playFailure();
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Lesson complete! 🎉'),
        content: Text('You earned $_pointsEarned ${RewardConfig.labelPlural}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Continue', ),
          ),
        ],
      ),
    );
  }

  Widget _buildTask(Task task) {
    switch (task.type) {
      case TaskType.trace:
        return TraceTaskWidget(
          task: task,
          onComplete: () => _onTaskComplete(task),
          onIncorrect: _onTaskIncorrect,
        );
      case TaskType.spelling:
        return SpellingTaskWidget(
          task: task,
          onComplete: () => _onTaskComplete(task),
          onIncorrect: _onTaskIncorrect,
        );
      case TaskType.wordSelection:
        return WordSelectionTaskWidget(
          task: task,
          onComplete: () => _onTaskComplete(task),
          onIncorrect: _onTaskIncorrect,
        );
      case TaskType.arrangeSentence:
        return ArrangeSentenceTaskWidget(
          task: task,
          onComplete: () => _onTaskComplete(task),
          onIncorrect: _onTaskIncorrect,
        );
      case TaskType.fillInBlank:
        return FillInBlankTaskWidget(
          task: task,
          onComplete: () => _onTaskComplete(task),
          onIncorrect: _onTaskIncorrect,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.lesson.tasks[_taskIndex];
    final progressAsync = ref.watch(progressProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            progressAsync.when(
              data: (progress) => CurrentLessonBanner(
                lessonTitle: widget.lesson.title,
                taskIndex: _taskIndex,
                totalTasks: widget.lesson.tasks.length,
                streak: progress.currentStreak,
                points: progress.totalPoints,
                onBack: () => Navigator.of(context).pop(),
                iconKey: _starIconKey,
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: KeyedSubtree(
                      key: ValueKey(task.id),
                      child: _buildTask(task),
                    ),
                  ),
                  if (_showingSuccess)
                    Container(
                      color: Colors.white.withValues(alpha: 0.8),
                      child: Center(
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.elasticOut,
                          builder: (context, value, child) {
                            return Transform.scale(scale: value, child: child);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 120,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Correct!',
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
