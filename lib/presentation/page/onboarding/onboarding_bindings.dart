import 'package:course_camp/presentation/page/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
