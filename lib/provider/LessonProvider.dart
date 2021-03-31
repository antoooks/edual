import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edual/model/Lesson.dart';
import 'package:edual/service/LessonService.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class LessonProvider extends ChangeNotifier {
  LessonService _api = locator<LessonService>();
  List<Lesson> lesson;

  Future<List<Lesson>> fetchLessons() async {
    var result = await _api.getDataCollection();
    lesson = result.docs
        .map((doc) => Lesson.fromJson(doc.data()))
        .toList();
    return lesson;
  }

  Stream<QuerySnapshot> fetchLessonsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Lesson> getLessonById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Lesson.fromJson(doc.data()) ;
  }

  Future removeLesson(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateLesson(Lesson data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addLesson(Lesson data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result;
  }
}