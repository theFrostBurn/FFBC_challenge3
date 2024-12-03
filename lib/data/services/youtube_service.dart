import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../domain/entities/track.dart';

class YoutubeService {
  final _yt = YoutubeExplode();

  Future<Track> getTrackFromUrl(String url) async {
    try {
      final video = await _yt.videos.get(url);
      final manifest = await _yt.videos.streamsClient.getManifest(url);
      final audioStream = manifest.audioOnly.withHighestBitrate();

      return Track(
        id: video.id.value,
        title: video.title,
        artist: video.author,
        thumbnailUrl: video.thumbnails.highResUrl,
        videoUrl: audioStream.url.toString(),
      );
    } catch (e) {
      throw Exception('Failed to get track info: $e');
    }
  }

  void dispose() {
    _yt.close();
  }
}
