import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

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

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Progress reset.')));
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
            OutlinedButton.icon(
              onPressed: () => _confirmAndReset(context, ref),
              icon: const Icon(Icons.restart_alt, color: Colors.red),
              label: const Text(
                'Reset Progress',
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error loading settings: $e')),
      ),
    );
  }
}
