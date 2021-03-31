import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edual/model/Task.dart';
import 'package:edual/service/TaskService.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class TaskProvider extends ChangeNotifier {
  TaskService _api = locator<TaskService>();
  List<Task> tasks;

  Future<List<Task>> fetchTasks() async {
    var result = await _api.getDataCollection();
    tasks = result.docs
        .map((doc) => Task.fromJson(doc.data()))
        .toList();
    return tasks;
  }

  Stream<QuerySnapshot> fetchTasksAsStream() {
    return _api.streamDataCollection();
  }

  Future<Task> getTaskById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Task.fromJson(doc.data()) ;
  }

  Future removeTask(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateTask(Task data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addTask(Task data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result;
  }
}