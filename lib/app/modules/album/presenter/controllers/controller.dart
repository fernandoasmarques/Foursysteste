import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/album.dart';
import '../../domain/entities/photo.dart';
import '../../domain/usecases/get_album_usecase_impl.dart';
import '../../domain/usecases/get_photo_usecase_impl.dart';

class Controller extends GetxController {
  final IGetAlbumUsecase _getAlbumUsecase;
  final IGetPhotoUsecase _getPhotoUsecase;
  final _albuns = <Album>[].obs;
  final _photos = <Photo>[].obs;
  final _albumId = RxInt(0);

  Controller(this._getAlbumUsecase, this._getPhotoUsecase);

  List<Album> get albuns => _albuns.toList();
  List<Photo> get photos => _photos.toList();

  @override
  void onInit() {
    ever<int>(_albumId, _getPhotos);
    _getAlbuns();
    super.onInit();
  }

  Future<void> _getAlbuns() async {
    final result = await _getAlbumUsecase();
    result.fold((l) {
      asuka.showSnackBar(SnackBar(
        content: Text('Erro ao buscar álbuns : ${l.message}'),
        duration: const Duration(seconds: 5),
      ));
    }, (r) {
      _albuns.addAll(r ?? []);
    });
  }

  Future<void> _getPhotos(int albumId) async {
    _photos.clear();
    final result = await _getPhotoUsecase(albumId: albumId);
    result.fold((l) {
      asuka.showSnackBar(SnackBar(
        content: Text('Erro ao buscar fotos : ${l.message}'),
        duration: const Duration(seconds: 5),
      ));
    }, (r) {
      _photos.addAll(r ?? []);
    });
  }

  void updateAlbumId(int albumId){
    _albumId.value = albumId;
  }
}
