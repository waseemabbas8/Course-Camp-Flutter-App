import 'package:course_camp/domain/entity/course.dart';
import 'package:course_camp/domain/entity/course_category.dart';
import 'package:course_camp/domain/repository/category_repository.dart';
import 'package:course_camp/domain/repository/course_repository.dart';
import 'package:course_camp/presentation/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController with GetTickerProviderStateMixin {
  final CategoryRepository _categoryRepository;
  final CourseRepository _courseRepository;

  HomeController(this._categoryRepository, this._courseRepository);

  late AnimationController _animController;
  AnimationController get animController => _animController;

  final RxInt _selectedCategoryIndex = 0.obs;
  int get selectedCategoryIndex => _selectedCategoryIndex.value;

  final RxList<CourseCategory> categories = RxList();

  final RxList<Course> coursesByCategory = RxList();

  final RxList<Course> popularCourses = RxList();

  @override
  void onInit() {
    super.onInit();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _getCoursesByCategoryId();
    _getPopularCourses();
  }

  @override
  void onClose() {
    super.onClose();
    _animController.dispose();
  }

  Future _getCategories() async {
    categories.value = await _categoryRepository.getCategories();
  }

  void _getCoursesByCategoryId() async {
    if (categories.isEmpty) {
      await _getCategories();
    }
    final categoryId = categories[selectedCategoryIndex].id;
    coursesByCategory.value =
        await _courseRepository.getCoursesByCategoryId(categoryId);
  }

  void _getPopularCourses() async {
    popularCourses.value = await _courseRepository.getPopularCourses();
  }

  void onCategoryItemClick(int index) {
    _selectedCategoryIndex.value = index;
    _getCoursesByCategoryId();
  }
}
