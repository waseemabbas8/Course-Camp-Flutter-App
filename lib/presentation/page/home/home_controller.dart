import 'package:course_camp/domain/entity/course.dart';
import 'package:course_camp/domain/entity/course_category.dart';
import 'package:course_camp/domain/repository/category_repository.dart';
import 'package:course_camp/domain/repository/course_repository.dart';
import 'package:course_camp/presentation/core/base/anim_controller.dart';
import 'package:get/get.dart';

class HomeController extends AnimController {
  final CategoryRepository _categoryRepository;
  final CourseRepository _courseRepository;

  HomeController(this._categoryRepository, this._courseRepository);

  final RxInt _selectedCategoryIndex = 0.obs;
  int get selectedCategoryIndex => _selectedCategoryIndex.value;

  final RxList<CourseCategory> categories = RxList();

  final RxList<Course> coursesByCategory = RxList();

  final RxList<Course> popularCourses = RxList();

  @override
  void onInit() {
    super.onInit();
    _getCoursesByCategoryId();
    _getPopularCourses();
  }

  Future _getCategories() async {
    categories.value = await _categoryRepository.getCategories();
  }

  void _getCoursesByCategoryId() async {
    if (categories.isEmpty) {
      await _getCategories();
    }
    final categoryId = categories[selectedCategoryIndex].id;
    coursesByCategory.value = await _courseRepository.getCoursesByCategoryId(categoryId);
  }

  void _getPopularCourses() async {
    popularCourses.value = await _courseRepository.getPopularCourses();
  }

  void onCategoryItemClick(int index) {
    _selectedCategoryIndex.value = index;
    _getCoursesByCategoryId();
  }

  void addCourseToMyList(int courseId) {
    _courseRepository.addCourseToMyList(courseId);
    coursesByCategory.refresh();
  }
}
