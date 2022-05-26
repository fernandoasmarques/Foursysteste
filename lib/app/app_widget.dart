import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_bindings.dart';
import 'modules/album/album_bindinds.dart';
import 'modules/album/presenter/view/album_page.dart';
import 'modules/album/presenter/view/photo_page.dart';
import 'modules/album/presenter/view/photo_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoursysTeste',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialBinding: AppBindings(),
      getPages: [
        GetPage(
          name: '/',
          page: () => AlbumPage(Get.find()),
          binding: AlbumBindings(),
        ),
        GetPage(
          name: '/photos',
          page: () => PhotoPage(Get.find()),
          binding: AlbumBindings(),
        ),
        GetPage(
          name: '/photoview',
          page: () => PhotoView(),
        ),
      ],
      navigatorObservers: [asuka.asukaHeroController],
    );
  }
}
