import 'package:course_camp/presentation/core/base/base_page.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/colors.dart';
import '../home/views/popular_course_list_view.dart';
import 'user_courses_controller.dart';
import 'views/my_courses_list_view.dart';

class UserCoursesPage extends BasePage<UserCoursesController> {
  const UserCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Spacing.v16,
          _appBar,
          Expanded(
            child: ListView(
              children: <Widget>[
                _getSearchBarUI(),
                const MyCoursesListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _appBar {
    return Padding(
      padding: Paddings.h20,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Explore',
                  textAlign: TextAlign.left,
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.blueGrey),
                ),
                Text(
                  'My Courses',
                  textAlign: TextAlign.left,
                  style: Get.textTheme.headline3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSearchBarUI() {
    return Padding(
      padding: Paddings.h20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: Get.width * 0.75,
            height: 65.toHeight,
            child: Padding(
              padding: Paddings.v8,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FAFB),
                  borderRadius: BorderRadii.all13,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: Paddings.h16,
                        child: TextFormField(
                          style: Get.textTheme.headline6?.copyWith(color: Colors.lightBlue),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: Get.textTheme.headline6,
                            labelStyle: Get.textTheme.subtitle1,
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60.toWidth,
                      height: 60.toWidth,
                      child: const Icon(Icons.search, color: CustomColors.lightGrey),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
