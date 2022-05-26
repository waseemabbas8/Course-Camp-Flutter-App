import 'package:course_camp/domain/entity/course.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../utils/file_utils.dart';

class CourseLocalDataSource {
  final RxMap<int, int> myCoursesIds = RxMap();

  Future<List<Course>> _getCourses() async {
    final jsonString = await FileUtils.readJsonFile('${FileUtils.jsonFileBasePath}courses.json');
    final courses = await compute(Course.toList, jsonString);
    for (var element in courses) {
      element.isMyList = myCoursesIds[element.id] != null;
    }
    return courses;
  }

  Future<List<Course>> getCoursesByCategoryId(int categoryId) async {
    final courses = await _getCourses();
    return courses.where((element) => element.categoryId == categoryId).toList();
  }

  Future<List<Course>> getPopularCourses() async {
    final courses = await _getCourses();
    return courses.where((element) => element.rating >= 4.5).toList();
  }

  Future<List<Course>> getMyCourses() async {
    final courses = await _getCourses();
    return courses.where((element) => element.isMyList).toList();
  }

  void addCourseToMyList(int courseId) {
    myCoursesIds[courseId] = courseId;
  }
}
