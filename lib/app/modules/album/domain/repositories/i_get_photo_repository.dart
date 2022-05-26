import 'package:dartz/dartz.dart';
import 'package:foursysteste/app/modules/album/domain/entities/photo.dart';

import '../errors/errors.dart';

abstract class IGetPhotoRepository {
  Future<Either<PhotoExcpetion, List<Photo>>> getPhotos(albumId);
}
