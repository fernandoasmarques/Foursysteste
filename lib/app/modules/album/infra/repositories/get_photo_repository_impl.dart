import 'package:dartz/dartz.dart';
import 'package:foursysteste/app/modules/album/domain/entities/photo.dart';
import 'package:foursysteste/app/modules/album/domain/errors/errors.dart';
import 'package:foursysteste/app/modules/album/domain/repositories/i_get_photo_repository.dart';

import '../datasources/i_get_photo_datasource.dart';

class GetPhotoRepositoryImpl implements IGetPhotoRepository{
final IGetPhotoDatasource _datasource;

  GetPhotoRepositoryImpl(this._datasource);

  @override
  Future<Either<PhotoExcpetion, List<Photo>>> getPhotos(albumId) async{
    try {
      return Right(await _datasource.getPhotos(albumId: albumId));
    } on PhotoExcpetion catch (e) {
      return Left(e);
    }
  }

}