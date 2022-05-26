import 'package:course_camp/data/repository/category_repository_impl.dart';
import 'package:course_camp/data/repository/course_repository_impl.dart';
import 'package:course_camp/data/source/category_local_data_source.dart';
import 'package:course_camp/data/source/course_local_data_source.dart';
import 'package:course_camp/domain/repository/category_repository.dart';
import 'package:course_camp/presentation/page/home/home_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repository/course_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryLocalDataSource());
    Get.lazyPut(() => CourseLocalDataSource());
    Get.lazyPut<CategoryRepository>(() => CategoryRepositoryImpl(Get.find()));
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find()));
  }
}
