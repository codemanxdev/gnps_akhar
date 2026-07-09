import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Speaks Punjabi (Gurmukhi) text aloud and plays feedback sounds.
///
/// Android: uses Google's TTS engine which supports Punjabi (India) natively.
/// iOS: AVSpeechSynthesizer does not reliably support Punjabi — this is a
/// known gap to revisit when we build the iOS version (likely bundled
/// pre-recorded audio instead of live TTS).
class AudioService {
  final FlutterTts _tts = FlutterTts();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  Future<void>? _initFuture;

  Future<void> _init() async {
    _initFuture ??= _doInit();
    return _initFuture;
  }

  Future<void> _doInit() async {
    await _tts.setLanguage('pa-IN');
    await _tts.setSpeechRate(0.4);
    await _tts.setPitch(1.0);
    await _sfxPlayer.setPlayerMode(PlayerMode.lowLatency);
  }

  Future<bool> isPunjabiAvailable() async {
    try {
      final result = await _tts.isLanguageAvailable('pa-IN');
      return result == true || result == 1;
    } catch (_) {
      return false;
    }
  }

  Future<void> speak(String text) async {
    await _init();
    await _tts.stop(); // Stop any current speech
    await _tts.speak(text);
  }

  Future<void> stop() async {
    await _tts.stop();
  }

  /// Success
  Future<void> playSuccess() async {
    await _init();
    try {
      await _sfxPlayer.stop(); // Ensure player is ready to start fresh
      await _sfxPlayer.play(AssetSource('sounds/success.wav'));
    } catch (e) {
      await SystemSound.play(SystemSoundType.click);
    }
    await HapticFeedback.mediumImpact();
  }

  /// Failure
  Future<void> playFailure() async {
    await _init();
    try {
      await _sfxPlayer.stop(); // Ensure player is ready to start fresh
      await _sfxPlayer.play(AssetSource('sounds/failure.wav'));
    } catch (e) {
      await HapticFeedback.heavyImpact();
    }
    await HapticFeedback.selectionClick();
  }

  /// Call from provider dispose to release native audio resources.
  void dispose() {
    _sfxPlayer.dispose();
  }
}
