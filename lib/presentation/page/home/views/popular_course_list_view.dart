import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entity/course.dart';
import '../home_controller.dart';

class PopularCourseListView extends StatelessWidget {
  const PopularCourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Obx(
        () => GridView(
          padding: Paddings.all8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List<Widget>.generate(
            controller.popularCourses.length,
            (int index) {
              final int count = controller.popularCourses.length;
              final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: controller.animController,
                  curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                ),
              );
              controller.animController.forward();
              return _CourseView(
                category: controller.popularCourses[index],
                animation: animation,
                animationController: controller.animController,
              );
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 32.0,
            crossAxisSpacing: 32.0,
            childAspectRatio: 0.8,
          ),
        ),
      ),
    );
  }
}

class _CourseView extends StatelessWidget {
  const _CourseView(
      {Key? key,
      required this.category,
      required this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

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
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation!.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                height: 280.toHeight,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8FAFB),
                              borderRadius: BorderRadii.all16,
                              // border: new Border.all(
                              //     color: DesignCourseAppTheme.notWhite),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                                        child: Text(
                                          category.title,
                                          textAlign: TextAlign.left,
                                          style: Get.textTheme.subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
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
                                    ],
                                  ),
                                ),
                                Spacing.h48,
                              ],
                            ),
                          ),
                        ),
                        Spacing.v48,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadii.all16,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadii.all16,
                          child: AspectRatio(
                              aspectRatio: 1.28, child: Image.asset(category.imagePath)),
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
