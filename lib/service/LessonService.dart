import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edual/service/BaseService.dart';
import 'package:flutter/foundation.dart';

class LessonService extends ChangeNotifier implements BaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path = "Lesson";
  CollectionReference ref;

  LessonService(){
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection(){
    return ref.get();
  }
  Stream<QuerySnapshot> streamDataCollection(){
    return ref.snapshots();
  }
  Future<DocumentSnapshot> getDocumentById(String id){
    return ref.doc(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.doc(id).delete();
  }
  Future<DocumentReference> addDocument(Map data){
    return ref.add(data);
  }
  Future<void> updateDocument(Map data, String id){
    return ref.doc(id).update(data);
  }
}