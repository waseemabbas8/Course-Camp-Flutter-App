import 'package:course_camp/domain/entity/course.dart';
import 'package:flutter/foundation.dart';

import '../utils/file_utils.dart';

class CourseLocalDataSource {
  Future<List<Course>> getCoursesByCategoryId(int categoryId) async {
    final jsonString = await FileUtils.readJsonFile(
        '${FileUtils.jsonFileBasePath}courses.json');
    final courses = await compute(Course.toList, jsonString);
    return courses
        .where((element) => element.categoryId == categoryId)
        .toList();
  }

  Future<List<Course>> getPopularCourses() async {
    final jsonString = await FileUtils.readJsonFile(
        '${FileUtils.jsonFileBasePath}courses.json');
    final courses = await compute(Course.toList, jsonString);
    return courses.where((element) => element.rating >= 4.5).toList();
  }
}
