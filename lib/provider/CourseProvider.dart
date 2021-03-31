import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edual/model/Course.dart';
import 'package:edual/service/CourseService.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class CourseProvider extends ChangeNotifier {
  CourseService _api = locator<CourseService>();
  List<Course> course;

  Future<List<Course>> fetchAccounts() async {
    var result = await _api.getDataCollection();
    course = result.docs
        .map((doc) => Course.fromJson(doc.data()))
        .toList();
    return course;
  }

  Stream<QuerySnapshot> fetchAccountsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Course> getAccountById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Course.fromJson(doc.data()) ;
  }

  Future removeAccount(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateAccount(Course data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addAccount(Course data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result;
  }
}