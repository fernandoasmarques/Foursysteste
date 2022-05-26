import '../models/photo_model.dart';

abstract class IGetPhotoDatasource{
  Future<List<PhotoModel>> getPhotos({required int albumId});
}