import 'package:course_camp/domain/entity/course_category.dart';

abstract class CategoryRepository {
  Future<List<CourseCategory>> getCategories();
}
