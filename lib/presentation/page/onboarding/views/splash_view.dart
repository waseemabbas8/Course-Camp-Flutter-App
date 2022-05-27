import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:course_camp/presentation/page/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();
    final _introAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
        .animate(CurvedAnimation(
      parent: controller.animController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _introAnimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200.toHeight),
            SizedBox(
              width: Get.width,
              child: Image.asset(
                controller.introImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: Paddings.v8,
              child: Text(
                "Clearhead",
                style: Get.textTheme.headline2,
              ),
            ),
            Padding(
              padding: Paddings.h60,
              child: Text(
                "Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyText1,
              ),
            ),
            Spacing.v48,
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: controller.onBeginClick,
                child: Container(
                  height: 55.toHeight,
                  padding: const EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: const Color(0xff132137),
                  ),
                  child: Text(
                    "Let's begin",
                    style: Get.textTheme.headline5?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
