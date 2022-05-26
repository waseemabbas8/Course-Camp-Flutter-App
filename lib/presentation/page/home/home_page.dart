import 'package:course_camp/presentation/core/base/base_page.dart';
import 'package:course_camp/presentation/core/utils/constants.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/colors.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:course_camp/presentation/page/home/home_controller.dart';
import 'package:course_camp/presentation/page/home/views/course_horizontal_list_view.dart';
import 'package:course_camp/presentation/page/home/views/popular_course_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                _getCategoryUI(),
                getPopularCourseUI(),
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
                  'Choose your',
                  textAlign: TextAlign.left,
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.blueGrey),
                ),
                Text(
                  'Design Course',
                  textAlign: TextAlign.left,
                  style: Get.textTheme.headline3,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50.toWidth,
            height: 50.toWidth,
            child: Image.asset('${ImagePath.basePath}img_user.png'),
          )
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

  Widget _getCategoryUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacing.v16,
        Padding(
          padding: Paddings.h20,
          child: Text(
            'Category',
            textAlign: TextAlign.left,
            style: Get.textTheme.headline4,
          ),
        ),
        Spacing.v16,
        SizedBox(
          height: 40.toHeight,
          child: Obx(
            () => ListView.separated(
              shrinkWrap: true,
              padding: Paddings.h20,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: _categoryItemBuilder,
              separatorBuilder: (context, index) => Spacing.h16,
            ),
          ),
        ),
        Spacing.v16,
        const CourseHorizontalListView(),
      ],
    );
  }

  Widget _categoryItemBuilder(BuildContext context, int index) {
    final category = controller.categories[index];
    return Obx(
      () => Container(
        width: 100.toWidth,
        decoration: BoxDecoration(
            color: controller.selectedCategoryIndex == index ? Colors.blue : Colors.white,
            borderRadius: BorderRadii.all24,
            border: Border.all(color: Colors.blue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: BorderRadii.all24,
            onTap: () {
              controller.onCategoryItemClick(index);
            },
            child: Padding(
              padding: Paddings.v12h18,
              child: Center(
                child: Text(
                  category.name,
                  textAlign: TextAlign.left,
                  style: Get.textTheme.bodyText2?.copyWith(
                    color: controller.selectedCategoryIndex == index ? Colors.white : Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: Paddings.h20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style: Get.textTheme.headline4,
          ),
          const PopularCourseListView(),
        ],
      ),
    );
  }
}
