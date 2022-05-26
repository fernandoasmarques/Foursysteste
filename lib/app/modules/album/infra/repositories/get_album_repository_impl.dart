import 'package:dartz/dartz.dart';

import '../../domain/entities/album.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/i_get_album_repository.dart';
import '../datasources/i_get_album_datasource.dart';

class GetAlbumRepositoryImpl implements IGetAlbumRepository {
  final IGetAlbumDatasource _datasource;

  GetAlbumRepositoryImpl(this._datasource);

  @override
  Future<Either<AlbumExcpetion, List<Album>>> getAlbuns() async {
    try {
      return Right(await _datasource.getAlbuns());
    } on AlbumExcpetion catch (e) {
      return Left(e);
    }
  }
}