import 'package:course_camp/data/source/course_local_data_source.dart';
import 'package:course_camp/domain/entity/course.dart';

import '../../domain/repository/course_repository.dart';

class CourseRepositoryImpl extends CourseRepository {
  final CourseLocalDataSource _courseLocalDataSource;

  CourseRepositoryImpl(this._courseLocalDataSource);
  @override
  Future<List<Course>> getPopularCourses() =>
      _courseLocalDataSource.getPopularCourses();

  @override
  Future<List<Course>> getCoursesByCategoryId(int categoryId) =>
      _courseLocalDataSource.getCoursesByCategoryId(categoryId);
}
