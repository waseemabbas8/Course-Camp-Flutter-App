import 'package:course_camp/presentation/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimController extends BaseController with GetTickerProviderStateMixin {
  late AnimationController _animController;
  AnimationController get animController => _animController;

  @override
  void onInit() {
    super.onInit();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    super.onClose();
    _animController.dispose();
  }
}
