import 'package:course_camp/presentation/page/course/user_courses_controller.dart';
import 'package:get/get.dart';

class UserCoursesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserCoursesController(Get.find()));
  }
}
