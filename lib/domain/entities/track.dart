class Track {
  final String id;
  final String title;
  final String? artist;
  final String? thumbnailUrl;
  final String? videoUrl;
  final Duration? duration;

  const Track({
    required this.id,
    required this.title,
    this.artist,
    this.thumbnailUrl,
    this.videoUrl,
    this.duration,
  });

  Track copyWith({
    String? id,
    String? title,
    String? artist,
    String? thumbnailUrl,
    String? videoUrl,
    Duration? duration,
  }) {
    return Track(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
    );
  }
}
