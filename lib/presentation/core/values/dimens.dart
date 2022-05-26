import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:flutter/material.dart';

const double spacing16 = 16;

class Spacing {
  Spacing._();
  static final h48 = SizedBox(width: 48.toWidth);
  static final v16 = SizedBox(height: 16.toHeight);
  static final h16 = SizedBox(width: 16.toWidth);
}

class Paddings {
  Paddings._();
  static final all4 = EdgeInsets.all(4.toWidth);
  static final v16 = EdgeInsets.symmetric(vertical: 16.toHeight);
  static final h16 = EdgeInsets.symmetric(horizontal: 16.toWidth);
  static final h20 = EdgeInsets.symmetric(horizontal: 20.toWidth);
  static final v8 = EdgeInsets.symmetric(vertical: 8.toHeight);
  static final v12h18 = EdgeInsets.symmetric(vertical: 12.toHeight, horizontal: 18.toWidth);
  static final b16r16 = EdgeInsets.only(bottom: 16.toHeight, right: 16.toWidth);
}

class BorderRadii {
  BorderRadii._();
  static const all24 = BorderRadius.all(Radius.circular(24));
  static const all16 = BorderRadius.all(Radius.circular(16));
  static const all13 = BorderRadius.all(Radius.circular(13));
  static const all8 = BorderRadius.all(Radius.circular(8));
}