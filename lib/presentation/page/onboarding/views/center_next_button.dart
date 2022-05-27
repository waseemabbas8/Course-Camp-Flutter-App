import 'package:animations/animations.dart';
import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding_controller.dart';

class CenterNextButton extends StatelessWidget {
  const CenterNextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();
    final _topMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0)).animate(CurvedAnimation(
      parent: controller.animController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _signUpMoveAnimation = Tween<double>(begin: 0, end: 0.8).animate(CurvedAnimation(
      parent: controller.animController,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _loginTextMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0)).animate(CurvedAnimation(
      parent: controller.animController,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return Padding(
      padding: EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: controller.animController,
              builder: (context, child) => AnimatedOpacity(
                opacity:
                    controller.animController.value >= 0.2 && controller.animController.value <= 0.4
                        ? 1
                        : 0,
                duration: const Duration(milliseconds: 480),
                child: _pageView(),
              ),
            ),
          ),
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: controller.animController,
              builder: (context, child) => Padding(
                padding: EdgeInsets.only(bottom: 38 - (38 * _signUpMoveAnimation.value)),
                child: Container(
                  height: 58.toHeight,
                  width: 58.toHeight + (200 * _signUpMoveAnimation.value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 + 32 * (1 - _signUpMoveAnimation.value)),
                    color: const Color(0xff132137),
                  ),
                  child: PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 480),
                    reverse: _signUpMoveAnimation.value < 0.5,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return SharedAxisTransition(
                        fillColor: Colors.transparent,
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                      );
                    },
                    child: _signUpMoveAnimation.value > 0.5
                        ? InkWell(
                            key: const ValueKey('Sign Up button'),
                            onTap: controller.onSignupClick,
                            child: Padding(
                              padding: Paddings.h16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: Get.textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            key: const ValueKey('next button'),
                            onTap: controller.onNextClick,
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SlideTransition(
              position: _loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: Get.textTheme.bodyText1?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff132137),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageView() {
    final OnboardingController controller = Get.find();
    int _selectedIndex = 0;

    if (controller.animController.value >= 0.5) {
      _selectedIndex = 2;
    } else if (controller.animController.value >= 0.3) {
      _selectedIndex = 1;
    } else if (controller.animController.value >= 0.1) {
      _selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: _selectedIndex == i ? const Color(0xff132137) : const Color(0xffE3E4E4),
                ),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
