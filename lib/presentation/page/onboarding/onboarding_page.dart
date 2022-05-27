import 'package:course_camp/presentation/core/base/base_page.dart';
import 'package:course_camp/presentation/core/values/colors.dart';
import 'package:course_camp/presentation/page/onboarding/views/center_next_button.dart';
import 'package:course_camp/presentation/page/onboarding/views/top_back_skip_view.dart';
import 'package:course_camp/presentation/page/onboarding/views/welcome_view.dart';
import 'package:flutter/material.dart';

import 'onboarding_controller.dart';
import 'views/relax_view.dart';
import 'views/splash_view.dart';
import 'views/work_view.dart';

class OnboardingPage extends BasePage<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightBlueGrey,
      body: ClipRect(
        child: Stack(
          children: const [
            SplashView(),
            RelaxView(),
            WorkView(),
            WelcomeView(),
            TopBackSkipView(),
            CenterNextButton(),
          ],
        ),
      ),
    );
  }
}
