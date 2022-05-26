import 'package:course_camp/presentation/page/course/course_bindings.dart';
import 'package:course_camp/presentation/page/course/user_courses_bindings.dart';
import 'package:course_camp/presentation/page/home/home_bindings.dart';
import 'package:course_camp/presentation/page/user/user_bindings.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    HomeBindings().dependencies();
    CourseBindings().dependencies();
    UserBindings().dependencies();
    UserCoursesBindings().dependencies();
  }
}
