import 'package:course_camp/domain/entity/course.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:course_camp/presentation/page/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseHorizontalListView extends StatelessWidget {
  const CourseHorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Padding(
      padding: Paddings.v16,
      child: SizedBox(
        height: 134.toHeight,
        width: double.infinity,
        child: Obx(
          () => ListView.builder(
            padding: Paddings.h16,
            itemCount: controller.coursesByCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final int count = controller.coursesByCategory.length > 10
                  ? 10
                  : controller.coursesByCategory.length;
              final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: controller.animController,
                      curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
              controller.animController.forward();

              return _CourseView(
                category: controller.coursesByCategory[index],
                animation: animation,
                animationController: controller.animController,
              );
            },
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
            transform: Matrix4.translationValues(100 * (1.0 - animation!.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                width: 280.toWidth,
                child: Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Spacing.h48,
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8FAFB),
                              borderRadius: BorderRadii.all16,
                            ),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 48 + 24.0,
                                ),
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
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '\$${category.money}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                letterSpacing: 0.27,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadii.all8,
                                              ),
                                              child: Padding(
                                                padding: Paddings.all4,
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadii.all16,
                            child: AspectRatio(
                                aspectRatio: 1.0, child: Image.asset(category.imagePath)),
                          )
                        ],
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
