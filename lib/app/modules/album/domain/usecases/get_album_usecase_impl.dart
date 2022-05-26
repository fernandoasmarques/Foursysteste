import 'package:dartz/dartz.dart';

import '../entities/album.dart';
import '../errors/errors.dart';
import '../repositories/i_get_album_repository.dart';

abstract class IGetAlbumUsecase {
  Future<Either<AlbumExcpetion, List<Album>?>> call();
}

class GetAlbumUsecaseImpl implements IGetAlbumUsecase {
  final IGetAlbumRepository _repository;

  GetAlbumUsecaseImpl(this._repository);

  @override
  Future<Either<AlbumExcpetion, List<Album>?>> call() {
    return _repository.getAlbuns();
  }
}
