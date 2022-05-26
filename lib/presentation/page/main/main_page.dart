import 'package:course_camp/presentation/core/values/colors.dart';
import 'package:course_camp/presentation/page/course/user_courses_page.dart';
import 'package:course_camp/presentation/page/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/base_page.dart';
import '../../core/values/dimens.dart';
import '../home/home_page.dart';
import 'main_controller.dart';

class MainPage extends BasePage<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedTabIndex,
          children: _tabItems,
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }

  final List<Widget> _tabItems = const [
    HomePage(),
    UserCoursesPage(),
    UserPage(),
  ];
}

class _BottomNavBar extends StatelessWidget {
  _BottomNavBar({Key? key}) : super(key: key);

  final MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(spacing16), topLeft: Radius.circular(spacing16)),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 0.2),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(spacing16),
              topRight: Radius.circular(spacing16),
            ),
            child: BottomNavigationBar(
              items: _tabItems,
              backgroundColor: CustomColors.lightBlueGrey,
              // selectedItemColor: CustomColors.ac1,
              // unselectedItemColor: CustomColors.black,
              selectedFontSize: 0,
              currentIndex: controller.selectedTabIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              onTap: controller.onTabSelected,
            ),
          )),
    );
  }

  List<BottomNavigationBarItem> get _tabItems {
    final List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < 3; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(controller.tabIcons[i]),
          label: controller.tabLabels[i],
        ),
      );
    }
    return items;
  }
}
