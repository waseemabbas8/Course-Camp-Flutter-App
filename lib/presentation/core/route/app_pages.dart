import 'package:course_camp/presentation/page/course/course_bindings.dart';
import 'package:course_camp/presentation/page/course/course_page.dart';
import 'package:course_camp/presentation/page/main/main_bindings.dart';
import 'package:course_camp/presentation/page/main/main_page.dart';
import 'package:course_camp/presentation/page/onboarding/onboarding_bindings.dart';
import 'package:course_camp/presentation/page/onboarding/onboarding_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBindings(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.course,
      page: () => const CoursePage(),
      binding: CourseBindings(),
    ),
  ];
}
