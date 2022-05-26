import 'package:dartz/dartz.dart';

import '../entities/album.dart';
import '../errors/errors.dart';

abstract class IGetAlbumRepository {
  Future<Either<AlbumExcpetion, List<Album>>> getAlbuns();
}
