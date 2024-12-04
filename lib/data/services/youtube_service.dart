import 'package:flutter/foundation.dart'; // debugPrint를 위해 추가
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeService {
  final _yt = YoutubeExplode();

  Future<String?> getStreamUrl(String youtubeUrl) async {
    try {
      // YouTube URL에서 video ID 추출
      final uri = Uri.parse(youtubeUrl);
      final videoId = uri.queryParameters['v'];
      if (videoId == null) return null;

      final manifest = await _yt.videos.streamsClient.getManifest(videoId);
      final audioOnly = manifest.audioOnly;
      if (audioOnly.isEmpty) return null;

      // 가장 높은 품질의 오디오 스트림 URL 반환
      return audioOnly.withHighestBitrate().url.toString();
    } catch (e) {
      debugPrint('Error getting stream URL: $e');
      return null;
    }
  }

  void dispose() {
    _yt.close();
  }
}
