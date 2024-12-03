class Track {
  final String id;
  final String title;
  final String artist;
  final String? thumbnailUrl;
  final String? videoUrl;

  const Track({
    required this.id,
    required this.title,
    required this.artist,
    this.thumbnailUrl,
    this.videoUrl,
  });

  Track copyWith({
    String? id,
    String? title,
    String? artist,
    String? thumbnailUrl,
    String? videoUrl,
  }) {
    return Track(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }
}
