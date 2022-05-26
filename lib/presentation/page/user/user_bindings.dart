import 'package:course_camp/presentation/page/user/user_controller.dart';
import 'package:get/get.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
