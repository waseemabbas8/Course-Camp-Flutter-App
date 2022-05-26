import 'package:course_camp/domain/entity/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getPopularCourses();
  Future<List<Course>> getCoursesByCategoryId(int categoryId);
}
