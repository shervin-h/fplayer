class AudioFileModel {
  final String path;
  final String title;
  final String artist;
  final String album;
  final String dateAdded;
  final String cover;

  AudioFileModel({
    required this.path,
    required this.title,
    required this.artist,
    required this.album,
    required this.dateAdded,
    required this.cover,
  });

  static AudioFileModel fromJson(Map<String, dynamic> json) {
    return AudioFileModel(
      path: json['path'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      dateAdded: json['dateAdded'],
      cover: json['cover'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'title': title,
      'artist': artist,
      'album': album,
      'dateAdded': dateAdded,
      'cover': cover,
    };
  }
}
