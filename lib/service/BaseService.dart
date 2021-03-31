import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class BaseService {
  Future<QuerySnapshot> getDataCollection(){}
  Stream<QuerySnapshot> streamDataCollection(){}
  Future<DocumentSnapshot> getDocumentById(String id){}
  Future<void> removeDocument(String id){}
  Future<DocumentReference> addDocument(Map data){}
  Future<void> updateDocument(Map data, String id){}
}