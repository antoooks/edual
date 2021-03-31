import 'package:cloud_firestore/cloud_firestore.dart';

class Course{
  String title;
  int courseId;
  int ageRestriction;
  String description;
  List<String> lessonID;
  String imageUrl;

  DocumentReference reference;

  Course(this.title, this.courseId, this.ageRestriction, {this.lessonID,this.description, this.imageUrl, this.reference});

  factory Course.fromSnapshot(DocumentSnapshot snapshot){
    Course course = Course.fromJson(snapshot.data());
    course.reference = snapshot.reference;
    return course;
  }

  static Course fromJson(Map<dynamic, dynamic> json) => _CourseFromJson(json);

  Map<String, dynamic> toJson() => _CourseToJson(this);

  @override
  String toString() => "Course<$title,$courseId,$ageRestriction,$description,$lessonID,$imageUrl>";

  static Course _CourseFromJson(Map<dynamic, dynamic> json){
    return Course(
      json['title'] as String,
      json['courseID'] as int,
      json['ageRestriction'] as int,
      description: json['description'] as String,
      lessonID: json['lessonID'] as List<String>,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> _CourseToJson(Course instance){
    return <String, dynamic>{
      'title': instance.title,
      'courseID': instance.courseId,
      'ageRestriction': instance.ageRestriction,
      'description': instance.description,
      'lessonID': instance.lessonID,
      'imageUrl': instance.imageUrl,
    };
  }
}