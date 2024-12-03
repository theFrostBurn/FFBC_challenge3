import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../../domain/entities/track.dart';

class AudioService {
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

      final audioSource = AudioSource.uri(
        Uri.parse(track.videoUrl!),
        tag: MediaItem(
          id: track.id,
          title: track.title,
          artist: track.artist,
          artUri: track.thumbnailUrl != null
              ? Uri.parse(track.thumbnailUrl!)
              : null,
        ),
      );

      await _player.setAudioSource(audioSource);
      _currentTrack = track;
      await _player.play();
    } catch (e) {
      throw Exception('Failed to play track: $e');
    }
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> resume() async {
    await _player.play();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  void dispose() {
    _player.dispose();
  }
}
