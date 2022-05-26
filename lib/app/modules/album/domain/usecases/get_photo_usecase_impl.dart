import 'package:dartz/dartz.dart';

import '../entities/photo.dart';
import '../errors/errors.dart';
import '../repositories/i_get_photo_repository.dart';

abstract class IGetPhotoUsecase {
  Future<Either<PhotoExcpetion, List<Photo>?>> call({required int albumId});
}

class GetPhotoUsecaseImpl implements IGetPhotoUsecase {
  final IGetPhotoRepository _repository;

  GetPhotoUsecaseImpl(this._repository);

  @override
  Future<Either<PhotoExcpetion, List<Photo>?>> call({required int albumId}) {
    return _repository.getPhotos(albumId);
  }
}
