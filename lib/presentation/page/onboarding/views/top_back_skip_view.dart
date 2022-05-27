import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding_controller.dart';

class TopBackSkipView extends StatelessWidget {
  const TopBackSkipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();
    final _animation = Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      parent: controller.animController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _skipAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 0)).animate(CurvedAnimation(
      parent: controller.animController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: 58.toHeight,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SlideTransition(
                //   position: _backAnimation,
                //   child:
                IconButton(
                  onPressed: controller.onBackClick,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  //   ),
                ),
                SlideTransition(
                  position: _skipAnimation,
                  child: IconButton(
                    onPressed: controller.onSkipClick,
                    icon: const Text('Skip'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
