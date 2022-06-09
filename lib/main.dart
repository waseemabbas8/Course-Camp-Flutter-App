import 'package:course_camp/presentation/core/route/app_routes.dart';
import 'package:course_camp/presentation/core/theme/light_theme.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'presentation/core/route/app_pages.dart';
import 'presentation/page/onboarding/onboarding_bindings.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(allowFontScaling: true);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      initialRoute: Routes.onboarding,
      initialBinding: OnboardingBindings(),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
