class AlbumExcpetion implements Exception {
  final String message;

  AlbumExcpetion(this.message);

  @override
  String toString() => 'AlbumExcpetion(message : $message)';
}

class PhotoExcpetion implements Exception {
  final String message;

  PhotoExcpetion(this.message);

  @override
  String toString() => 'PhotoExcpetion(message : $message)';
}
