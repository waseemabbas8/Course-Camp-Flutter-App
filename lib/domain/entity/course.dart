import 'package:json_annotation/json_annotation.dart';

import '../../data/utils/perser.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final int id;
  @JsonKey(name: 'category_id')
  final int categoryId;
  final String title;
  @JsonKey(name: 'lesson_count')
  final int lessonCount;
  final double money;
  final double rating;
  @JsonKey(name: 'image_path')
  final String imagePath;

  Course({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.lessonCount,
    required this.money,
    required this.rating,
    required this.imagePath,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  static List<Course> toList(String jsonString) =>
      Parser.toList<Course>(jsonString, Course.fromJson);
}
