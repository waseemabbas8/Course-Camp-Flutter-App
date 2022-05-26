import 'package:course_camp/data/source/category_local_data_source.dart';
import 'package:course_camp/domain/entity/course_category.dart';
import 'package:course_camp/domain/repository/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryLocalDataSource _categoryLocalDataSource;

  CategoryRepositoryImpl(this._categoryLocalDataSource);

  @override
  Future<List<CourseCategory>> getCategories() =>
      _categoryLocalDataSource.getCategories();
}
