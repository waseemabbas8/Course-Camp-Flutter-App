import 'package:course_camp/presentation/core/route/app_routes.dart';
import 'package:course_camp/presentation/core/theme/light_theme.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/page/main/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'presentation/core/route/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  _initDependencies();
  runApp(const MyApp());
}

void _initDependencies() {
  ScreenUtil.init(allowFontScaling: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      initialRoute: Routes.main,
      initialBinding: MainBindings(),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
