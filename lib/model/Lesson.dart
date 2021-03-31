import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  int lessonId;
  int courseId;
  String description;

  DocumentReference reference;

  Lesson(this.lessonId, this.courseId, {this.description,this.reference});

  static Lesson fromJson(Map<dynamic, dynamic> json) => _LessonFromJson(json);

  Map<String, dynamic> toJson() => _LessonToJson(this);

  @override
  String toString() => "Lesson<$lessonId,$courseId,$description>";

  static Lesson _LessonFromJson(Map<dynamic, dynamic> json){
    return Lesson(
      json['lessonId'] as int,
      json['courseId'] as int,
    );
  }

  static Map<String, dynamic> _LessonToJson(Lesson instance){
    return <String, dynamic>{
      'lessonId': instance.lessonId,
      'courseId': instance.courseId,
      'description': instance.description,
    };
  }
}