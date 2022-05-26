import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/customscrollbehavior.dart';
import '../controllers/controller.dart';

class PhotoPage extends StatelessWidget {
  final Controller _controller;

  const PhotoPage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título: ${Get.arguments as String}'),
        centerTitle: true,
      ),
      body: Obx(
        () => ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                _controller.photos.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    child:
                        Image.network(_controller.photos[index].thumbnailUrl),
                    onTap: () {
                      Get.toNamed("/photoview",
                          arguments: _controller.photos[index]);
                    },
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
