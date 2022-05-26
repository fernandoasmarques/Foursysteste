import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/customscrollbehavior.dart';
import '../controllers/controller.dart';

class AlbumPage extends StatelessWidget {
  final Controller _controller;
  const AlbumPage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álbuns'),
        centerTitle: true,
      ),
      body: Obx(
        () => ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: ListView.separated(
              itemCount: _controller.albuns.length,
              itemBuilder: (context, index) {
                final album = _controller.albuns[index];
                return ListTile(
                  leading: Text(album.id.toString()),
                  title: Text(album.title),
                  onTap: () {
                    _controller.updateAlbumId(album.id);
                    Get.toNamed("/photos", arguments: album.title);
                    
                  },
                );
              },
              separatorBuilder: (_, __) {
                return const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Divider(),
                );
              }),
        ),
      ),
    );
  }
}


