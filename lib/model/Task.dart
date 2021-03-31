import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  int taskId;
  int lessonId;
  int parentId;
  int kidId;
  double rewardPoint;

  DocumentReference reference;

  Task(this.taskId, this.lessonId, this.parentId, this.kidId, this.rewardPoint);

  static Task fromJson(Map<dynamic, dynamic> json) => _TaskFromJson(json);

  Map<String, dynamic> toJson() => _TaskToJson(this);

  @override
  String toString() => "Task<$taskId,$lessonId,$parentId,$kidId,$rewardPoint>";

  static Task _TaskFromJson(Map<dynamic, dynamic> json) {
    return Task(
      json['taskId'] as int,
      json['lessonId'] as int,
      json['parentId'] as int,
      json['kidId'] as int,
      json['rewardPoint'] as double,
    );
  }

  static Map<String, dynamic> _TaskToJson(Task instance) {
    return <String, dynamic>{
      'taskId': instance.taskId,
      'lessonId': instance.lessonId,
      'parentId': instance.parentId,
      'kidId': instance.kidId,
      'rewardPoint': instance.rewardPoint,
    };
  }
}