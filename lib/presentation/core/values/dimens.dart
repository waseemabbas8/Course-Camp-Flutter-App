import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:flutter/material.dart';

const double spacing16 = 16;

class Spacing {
  Spacing._();
  static final h48 = SizedBox(width: 48.toWidth);
  static final v48 = SizedBox(height: 48.toHeight);
  static final v16 = SizedBox(height: 16.toHeight);
  static final h16 = SizedBox(width: 16.toWidth);
  static final v8 = SizedBox(height: 8.toHeight);
  static final v4 = SizedBox(height: 4.toHeight);
}

class Paddings {
  Paddings._();
  static final all4 = EdgeInsets.all(4.toWidth);
  static final all8 = EdgeInsets.all(8.toWidth);
  static final all24 = EdgeInsets.all(24.toWidth);
  static final v16 = EdgeInsets.symmetric(vertical: 16.toHeight);
  static final v20 = EdgeInsets.symmetric(vertical: 20.toHeight);
  static final h16 = EdgeInsets.symmetric(horizontal: 16.toWidth);
  static final h20 = EdgeInsets.symmetric(horizontal: 20.toWidth);
  static final h60 = EdgeInsets.symmetric(horizontal: 60.toWidth);
  static final v8 = EdgeInsets.symmetric(vertical: 8.toHeight);
  static final v12h18 = EdgeInsets.symmetric(vertical: 12.toHeight, horizontal: 18.toWidth);
  static final v16h20 = EdgeInsets.symmetric(vertical: 16.toHeight, horizontal: 20.toWidth);
  static final b16r16 = EdgeInsets.only(bottom: 16.toHeight, right: 16.toWidth);
}

class BorderRadii {
  BorderRadii._();
  static const all24 = BorderRadius.all(Radius.circular(24));
  static const all16 = BorderRadius.all(Radius.circular(16));
  static const all13 = BorderRadius.all(Radius.circular(13));
  static const all8 = BorderRadius.all(Radius.circular(8));
}
