import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/journey.dart';
import 'models/progress.dart';
import 'repositories/content_repository.dart';
import 'repositories/progress_repository.dart';
import 'services/audio_service.dart';
import 'services/progress_service.dart';

final contentRepositoryProvider = Provider((ref) => ContentRepository());
final progressRepositoryProvider = Provider((ref) => ProgressRepository());
final audioServiceProvider = Provider((ref) {
  final service = AudioService();
  ref.onDispose(() => service.dispose());
  return service;
});

final progressServiceProvider = Provider((ref) {
  return ProgressService(ref.read(progressRepositoryProvider));
});

final journeyProvider = FutureProvider<Journey>((ref) async {
  final repo = ref.read(contentRepositoryProvider);
  return repo.checkForUpdatesAndSync();
});

class ProgressNotifier extends StateNotifier<AsyncValue<LocalProgress>> {
  final ProgressRepository _repository;
  final ProgressService _service;
  late final Future<void> _initialLoad;

  ProgressNotifier(this._repository, this._service)
    : super(const AsyncValue.loading()) {
    _initialLoad = _load();
  }

  Future<void> _load() async {
    final progress = await _repository.load();
    state = AsyncValue.data(progress);
  }

  Future<void> registerAppOpen() async {
    await _initialLoad;
    final current = state.value;
    if (current == null) return;
    final updated = await _service.registerAppOpen(current);
    state = AsyncValue.data(updated);
  }

  Future<void> ensureFirstLessonUnlocked(Journey journey) async {
    await _initialLoad;
    final current = state.value;
    if (current == null) return;
    final updated = await _service.ensureFirstLessonUnlocked(current, journey);
    state = AsyncValue.data(updated);
  }

  Future<void> completeLesson(
    Journey journey,
    String lessonId,
    int points,
  ) async {
    await _initialLoad;
    final current = state.value;
    if (current == null) return;
    final updated = await _service.completeLesson(
      progress: current,
      journey: journey,
      lessonId: lessonId,
      pointsEarned: points,
    );
    state = AsyncValue.data(LocalProgress.fromJson(updated.toJson()));
  }

  /// Wipes progress and resets to a fresh default. Used by the
  /// "Reset Progress" button on the Profile screen.
  Future<void> reset() async {
    await _initialLoad;
    await _repository.clear();
    final fresh = LocalProgress();
    await _repository.save(fresh);
    state = AsyncValue.data(fresh);
  }
}

final progressProvider =
    StateNotifierProvider<ProgressNotifier, AsyncValue<LocalProgress>>((ref) {
      return ProgressNotifier(
        ref.read(progressRepositoryProvider),
        ref.read(progressServiceProvider),
      );
    });
