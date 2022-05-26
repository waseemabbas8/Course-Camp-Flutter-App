// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      categoryId: json['category_id'] as int,
      title: json['title'] as String,
      lessonCount: json['lesson_count'] as int,
      money: (json['money'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      imagePath: json['image_path'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'title': instance.title,
      'lesson_count': instance.lessonCount,
      'money': instance.money,
      'rating': instance.rating,
      'image_path': instance.imagePath,
    };
