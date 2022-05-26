import 'dart:convert';

import 'package:course_camp/data/utils/perser.dart';

class CourseCategory {
  final int id;
  final String name;

  CourseCategory({required this.id, required this.name});

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  static List<CourseCategory> toList(String jsonString) =>
      Parser.toList<CourseCategory>(jsonString, CourseCategory.fromJson);
}
