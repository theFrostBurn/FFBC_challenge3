import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import '../../domain/entities/track.dart';

class AudioService extends ChangeNotifier {
  final _player = AudioPlayer();
  Track? _currentTrack;

  Track? get currentTrack => _currentTrack;
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

  Future<void> stop() async {
    await _player.stop();
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
