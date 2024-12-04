import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import '../../domain/entities/track.dart';

class AudioService extends ChangeNotifier {
  final _player = AudioPlayer();
  Track? _currentTrack;
  bool _isPlaying = false;
  bool _isInitialized = false;

  AudioService() {
    _player.playerStateStream.listen((state) {
      final playing = state.playing;
      if (_isPlaying != playing) {
        _isPlaying = playing;
        notifyListeners();
      }
    });
  }

  Track? get currentTrack => _currentTrack;
  bool get isPlaying => _isPlaying;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
  Stream<Duration?> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;

  Future<void> play(Track track) async {
    try {
      if (track.videoUrl == null) {
        throw Exception('Track URL is null');
      }

      await _player.stop();
      await _player.setUrl(track.videoUrl!);
      _currentTrack = track;
      await _player.play();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to play track: $e');
    }
  }

  Future<void> pause() async {
    await _player.pause();
    notifyListeners();
  }

  Future<void> resume() async {
    await _player.play();
    notifyListeners();
  }

  Future<void> togglePlay() async {
    if (_currentTrack == null) return;

    if (_isPlaying) {
      await pause();
    } else {
      await resume();
    }
  }

  Future<void> stop() async {
    await _player.stop();
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
    notifyListeners();
  }

  Future<void> initializeAudioPlayer() async {
    _isInitialized = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
