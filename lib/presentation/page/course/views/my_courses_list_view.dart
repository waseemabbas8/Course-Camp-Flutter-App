import 'package:course_camp/domain/entity/course.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:course_camp/presentation/page/course/user_courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCoursesListView extends StatelessWidget {
  const MyCoursesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.h20,
      child: Obx(_listBuilder),
    );
  }

  Widget _listBuilder() {
    UserCoursesController controller = Get.find();
    return ListView.separated(
      padding: Paddings.v16,
      itemCount: controller.courses.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final int count = controller.courses.length > 10 ? 10 : controller.courses.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller.animController,
                curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
        controller.animController.forward();

        return _CourseView(
          category: controller.courses[index],
          animation: animation,
          animationController: controller.animController,
        );
      },
      separatorBuilder: (BuildContext context, int index) => Spacing.v16,
    );
  }
}

class _CourseView extends StatelessWidget {
  const _CourseView({
    Key? key,
    required this.category,
    required this.animationController,
    this.animation,
    this.callback,
  }) : super(key: key);

  final VoidCallback? callback;
  final Course category;
  final AnimationController animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(100 * (1.0 - animation!.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                width: Get.width,
                height: 125.toHeight,
                child: Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8FAFB),
                              borderRadius: BorderRadii.all16,
                            ),
                            child: Row(
                              children: <Widget>[
                                Spacing.h16,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16, right: 8),
                                        child: Text(
                                          category.title,
                                          textAlign: TextAlign.left,
                                          style: Get.textTheme.subtitle2,
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16, bottom: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${category.lessonCount} lesson',
                                              textAlign: TextAlign.left,
                                              style: Get.textTheme.bodyText2?.copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '${category.rating}',
                                                  textAlign: TextAlign.left,
                                                  style: Get.textTheme.headline5?.copyWith(
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: Paddings.b16r16,
                                        child: Text(
                                          '\$${category.money}',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.27,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacing.h48,
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60.toWidth,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: Paddings.all24,
                        child: ClipRRect(
                          borderRadius: BorderRadii.all16,
                          child:
                              AspectRatio(aspectRatio: 1.0, child: Image.asset(category.imagePath)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
