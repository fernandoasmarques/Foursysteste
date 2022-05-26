import 'package:get/get.dart';

import 'domain/repositories/i_get_album_repository.dart';
import 'domain/repositories/i_get_photo_repository.dart';
import 'domain/usecases/get_album_usecase_impl.dart';
import 'domain/usecases/get_photo_usecase_impl.dart';
import 'external/datasources/get_album_datasource_impl.dart';
import 'external/datasources/get_photo_datasource_impl.dart';
import 'infra/datasources/i_get_album_datasource.dart';
import 'infra/datasources/i_get_photo_datasource.dart';
import 'infra/repositories/get_album_repository_impl.dart';
import 'infra/repositories/get_photo_repository_impl.dart';
import 'presenter/controllers/controller.dart';

class AlbumBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller(Get.find(), Get.find()));
    //
    Get.lazyPut<IGetAlbumUsecase>(() => GetAlbumUsecaseImpl(Get.find()));
    Get.lazyPut<IGetAlbumRepository>(() => GetAlbumRepositoryImpl(Get.find()));
    Get.lazyPut<IGetAlbumDatasource>(() => GetAlbumDatasourceImpl());
    //
    Get.lazyPut<IGetPhotoUsecase>(() => GetPhotoUsecaseImpl(Get.find()));
    Get.lazyPut<IGetPhotoRepository>(() => GetPhotoRepositoryImpl(Get.find()));
    Get.lazyPut<IGetPhotoDatasource>(() => GetPhotoDatasourceImpl());
  }
}
