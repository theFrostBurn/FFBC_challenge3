import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import '../../domain/entities/track.dart';
import '../constants/track_data.dart';
import '../services/youtube_service.dart';

class AudioService extends ChangeNotifier {
  final _player = AudioPlayer();
  final YoutubeService _youtubeService;
  Track? _currentTrack;
  bool _isPlaying = false;

  List<Track> get _currentPlaylist {
    if (_currentTrack == null) return [];

    if (TrackData.trendTracks.any((track) => track.id == _currentTrack!.id)) {
      return TrackData.trendTracks;
    } else if (TrackData.kpopTracks
        .any((track) => track.id == _currentTrack!.id)) {
      return TrackData.kpopTracks;
    } else if (TrackData.hiphopTracks
        .any((track) => track.id == _currentTrack!.id)) {
      return TrackData.hiphopTracks;
    } else if (TrackData.popTracks
        .any((track) => track.id == _currentTrack!.id)) {
      return TrackData.popTracks;
    } else if (TrackData.indieTracks
        .any((track) => track.id == _currentTrack!.id)) {
      return TrackData.indieTracks;
    } else if (TrackData.relaxTracks
        .any((track) => track.id == _currentTrack!.id)) {
      return TrackData.relaxTracks;
    }

    return TrackData.allTracks;
  }

  int get _currentIndex {
    if (_currentTrack == null) return -1;
    return _currentPlaylist
        .indexWhere((track) => track.id == _currentTrack!.id);
  }

  AudioService(this._youtubeService) {
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
      if (track.youtubeUrl == null) {
        throw Exception('Track URL is null');
      }

      final streamUrl = await _youtubeService.getStreamUrl(track.youtubeUrl!);
      if (streamUrl == null) {
        throw Exception('Failed to get stream URL');
      }

      await _player.stop();
      await _player.setUrl(streamUrl);
      _currentTrack = track;
      await _player.play();
      notifyListeners();
    } catch (e) {
      debugPrint('Error playing track: $e');
      throw Exception('Failed to play track: $e');
    }
  }

  Future<void> playPrevious() async {
    final currentIndex = _currentIndex;
    if (_currentPlaylist.isEmpty) return;

    // 현재 인덱스가 0이면 마지막 곡으로, 아니면 이전 곡으로
    final previousIndex =
        currentIndex <= 0 ? _currentPlaylist.length - 1 : currentIndex - 1;

    final previousTrack = _currentPlaylist[previousIndex];
    await play(previousTrack);
  }

  Future<void> playNext() async {
    final currentIndex = _currentIndex;
    if (_currentPlaylist.isEmpty) return;

    // 현재 인덱스가 마지막이면 첫 곡으로, 아니면 다음 곡으로
    final nextIndex =
        currentIndex >= _currentPlaylist.length - 1 ? 0 : currentIndex + 1;

    final nextTrack = _currentPlaylist[nextIndex];
    await play(nextTrack);
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

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
