import 'package:course_camp/domain/entity/course.dart';
import 'package:get/get.dart';

abstract class CourseRepository {
  Future<List<Course>> getPopularCourses();
  Future<List<Course>> getCoursesByCategoryId(int categoryId);
  Future<List<Course>> getMyCourses();
  void addCourseToMyList(int courseId);
  RxMap<int, int> get myCoursesIds;
}
