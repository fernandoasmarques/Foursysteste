import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/photo.dart';

class PhotoView extends StatelessWidget {
   PhotoView({Key? key}) : super(key: key);

  final Photo photo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: Center(child: Image.network(photo.url)),
    );
  }
}
