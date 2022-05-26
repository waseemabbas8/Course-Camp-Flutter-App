import 'package:course_camp/presentation/core/base/base_controller.dart';
import 'package:course_camp/presentation/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  final RxInt _selectedTabIndex = RxInt(0);

  int get selectedTabIndex => _selectedTabIndex.value;

  final tabIcons = [
    Icons.home_filled,
    Icons.chrome_reader_mode_outlined,
    Icons.person
  ];
  final tabLabels = [labelHome, labelMyCourses, labelUser];

  void onTabSelected(int index) {
    _selectedTabIndex.value = index;
  }
}
