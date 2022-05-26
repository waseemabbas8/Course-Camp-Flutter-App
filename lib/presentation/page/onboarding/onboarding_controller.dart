import 'package:course_camp/presentation/core/base/base_controller.dart';
import 'package:course_camp/presentation/core/route/app_routes.dart';
import 'package:course_camp/presentation/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends BaseController
    with GetTickerProviderStateMixin {
  late AnimationController _animController;

  AnimationController get animController => _animController;

  @override
  void onInit() {
    super.onInit();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 8,
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
    _animController.dispose();
  }

  String get introImage => '${ImagePath.basePath}img_intro.png';

  String get relaxImage => '${ImagePath.basePath}img_relax.png';

  String get workImage => '${ImagePath.basePath}img_work.png';

  String get welcomeImage => '${ImagePath.basePath}img_welcome.png';

  void onBeginClick() {
    animController.animateTo(0.2);
  }

  void onSkipClick() {
    Get.offNamed(Routes.main);
  }

  void onBackClick() {
    if (_animController.value >= 0 && _animController.value <= 0.2) {
      _animController.animateTo(0.0);
    } else if (_animController.value > 0.2 && _animController.value <= 0.4) {
      _animController.animateTo(0.2);
    } else if (_animController.value > 0.4 && _animController.value <= 0.6) {
      _animController.animateTo(0.4);
    } else if (_animController.value > 0.6 && _animController.value <= 0.8) {
      _animController.animateTo(0.6);
    } else if (_animController.value > 0.8 && _animController.value <= 1.0) {
      _animController.animateTo(0.8);
    }
  }

  void onNextClick() {
    if (_animController.value >= 0 && _animController.value <= 0.2) {
      _animController.animateTo(0.4);
    } else if (_animController.value > 0.2 && _animController.value <= 0.4) {
      _animController.animateTo(0.6);
    } else if (_animController.value > 0.4 && _animController.value <= 0.6) {
      _animController.animateTo(0.8);
    }
  }

  void onSignupClick() {
    Get.offNamed(Routes.main);
  }

  void onLoginClick() {}
}
