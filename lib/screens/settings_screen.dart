import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../providers.dart';
import '../tools/checkpoint_recorder_screen.dart';
import 'intro_screen.dart';

const List<Color> _themeColorOptions = [
  Colors.blue,
  Colors.purple,
  Colors.pink,
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.green,
  Colors.teal,
  Colors.indigo,
];

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _confirmAndReset(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset progress?'),
        content: const Text(
          'This clears all points, streaks, and lesson progress, and reloads '
          'lesson content fresh. This can\'t be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await ref.read(progressProvider.notifier).reset();
    await ref.read(contentRepositoryProvider).clearCache();
    ref.invalidate(journeyProvider);

    final journey = await ref.read(journeyProvider.future);
    await ref
        .read(progressProvider.notifier)
        .ensureFirstLessonUnlocked(journey);

    // reset() leaves hasCompletedOnboarding = false, so send the user back
    // through onboarding and clear the stack so back-navigation can't
    // return them to a screen built against the now-wiped state.
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const IntroScreen()),
        (route) => false,
      );
    }
  }

  Future<void> _debugCompleteAllLessons(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final journey = await ref.read(journeyProvider.future);
    await ref.read(progressProvider.notifier).debugCompleteAllLessons(journey);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All lessons marked complete (debug).')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: progressAsync.when(
        data: (progress) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              secondary: const Icon(Icons.volume_up_outlined),
              title: const Text('Sound'),
              value: progress.soundEnabled,
              onChanged: (value) {
                ref.read(progressProvider.notifier).updateSoundEnabled(value);
                if (value) SystemSound.play(SystemSoundType.click);
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.vibration),
              title: const Text('Haptic feedback'),
              value: progress.hapticsEnabled,
              onChanged: (value) {
                ref.read(progressProvider.notifier).updateHapticsEnabled(value);
                if (value) HapticFeedback.heavyImpact();
              },
            ),
            const Divider(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Theme color'),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _themeColorOptions.map((color) {
                  final isSelected =
                      progress.themeSeedColor == color.toARGB32();
                  return GestureDetector(
                    onTap: () => ref
                        .read(progressProvider.notifier)
                        .updateThemeSeedColor(color.toARGB32()),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(
                                color: Theme.of(context).colorScheme.onSurface,
                                width: 3,
                              )
                            : null,
                      ),
                      child: isSelected
                          ? const Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(height: 32),
            _SettingsActionButton(
              onPressed: () => _confirmAndReset(context, ref),
              icon: Icons.restart_alt,
              label: 'Reset Progress',
              isDestructive: true,
            ),
            if (kDebugMode) ...[
              const Divider(height: 32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Debug Tools',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _SettingsActionButton(
                onPressed: () => _debugCompleteAllLessons(context, ref),
                icon: Icons.done_all,
                label: 'Mark All Lessons Complete',
              ),
              const SizedBox(height: 12),
              _SettingsActionButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CheckpointRecorderScreen(),
                  ),
                ),
                icon: Icons.edit_road,
                label: 'Checkpoint Recorder',
              ),
            ],
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error loading settings: $e')),
      ),
    );
  }
}

class _SettingsActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool isDestructive;

  const _SettingsActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: color),
        label: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: color != null ? BorderSide(color: color) : null,
          minimumSize: const Size(double.infinity, 52),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
