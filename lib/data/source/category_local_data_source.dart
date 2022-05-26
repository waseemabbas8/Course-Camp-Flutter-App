import 'package:course_camp/data/utils/file_utils.dart';
import 'package:course_camp/domain/entity/course_category.dart';
import 'package:flutter/foundation.dart';

class CategoryLocalDataSource {
  Future<List<CourseCategory>> getCategories() async {
    final jsonString = await FileUtils.readJsonFile(
        '${FileUtils.jsonFileBasePath}categories.json');
    return compute(CourseCategory.toList, jsonString);
  }
}
