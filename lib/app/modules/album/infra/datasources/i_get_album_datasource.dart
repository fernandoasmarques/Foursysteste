import '../models/album_model.dart';

abstract class IGetAlbumDatasource {
  Future<List<AlbumModel>> getAlbuns();
}
