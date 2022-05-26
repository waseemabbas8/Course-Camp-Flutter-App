import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({Key? key}) : super(key: key);
}
