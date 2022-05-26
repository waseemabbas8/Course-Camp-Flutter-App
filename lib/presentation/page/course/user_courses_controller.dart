import 'package:course_camp/domain/entity/course.dart';
import 'package:course_camp/domain/repository/course_repository.dart';
import 'package:course_camp/presentation/core/base/anim_controller.dart';
import 'package:get/get.dart';

class UserCoursesController extends AnimController {
  final CourseRepository _courseRepository;

  UserCoursesController(this._courseRepository);

  final RxList<Course> _courses = RxList();
  List<Course> get courses => _courses;

  @override
  void onInit() {
    super.onInit();
    _courseRepository.myCoursesIds.listen((value) {
      _getMyCourses();
    });
  }

  void _getMyCourses() async {
    _courses.value = await _courseRepository.getMyCourses();
  }
}
