class Track {
  final String id;
  final String title;
  final String artist;
  final String? thumbnailUrl;
  final String? youtubeUrl;

  const Track({
    required this.id,
    required this.title,
    required this.artist,
    this.thumbnailUrl,
    this.youtubeUrl,
  });

  Track copyWith({
    String? id,
    String? title,
    String? artist,
    String? thumbnailUrl,
    String? youtubeUrl,
  }) {
    return Track(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
    );
  }
}
