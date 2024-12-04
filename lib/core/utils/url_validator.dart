import 'package:http/http.dart' as http;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../data/constants/track_data.dart';

class UrlValidator {
  static Future<bool> isImageUrlValid(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200 &&
          response.headers['content-type']?.startsWith('image/') == true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> isYoutubeUrlValid(String url) async {
    try {
      final yt = YoutubeExplode();
      try {
        await yt.videos.get(url);
        return true;
      } finally {
        yt.close();
      }
    } catch (e) {
      return false;
    }
  }

  static Future<void> validateTrackData() async {
    print('\n=== Checking All Tracks ===');
    for (var track in TrackData.allTracks) {
      await _validateTrack(track);
    }

    print('\n=== Checking K-POP Tracks ===');
    for (var track in TrackData.kpopTracks) {
      await _validateTrack(track);
    }

    print('\n=== Checking Hip-hop Tracks ===');
    for (var track in TrackData.hiphopTracks) {
      await _validateTrack(track);
    }

    print('\n=== Checking POP Tracks ===');
    for (var track in TrackData.popTracks) {
      await _validateTrack(track);
    }

    print('\n=== Checking Indie Tracks ===');
    for (var track in TrackData.indieTracks) {
      await _validateTrack(track);
    }

    print('\n=== Checking Relax Tracks ===');
    for (var track in TrackData.relaxTracks) {
      await _validateTrack(track);
    }

    print('\n=== Checking Trend Tracks ===');
    for (var track in TrackData.trendTracks) {
      await _validateTrack(track);
    }
  }

  static Future<void> _validateTrack(track) async {
    print('\nChecking track: ${track.title}');

    if (track.thumbnailUrl != null) {
      final isImageValid = await isImageUrlValid(track.thumbnailUrl!);
      if (!isImageValid) {
        print('❌ Invalid thumbnail URL: ${track.thumbnailUrl}');
      } else {
        print('✅ Valid thumbnail URL');
      }
    }

    if (track.videoUrl != null) {
      final isVideoValid = await isYoutubeUrlValid(track.videoUrl!);
      if (!isVideoValid) {
        print('❌ Invalid YouTube URL: ${track.videoUrl}');
      } else {
        print('✅ Valid YouTube URL');
      }
    }
  }
}
