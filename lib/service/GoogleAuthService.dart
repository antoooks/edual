import 'dart:io';

import 'package:flutter/foundation.dart';

import 'BaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthService implements BaseAuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

  bool _success = false;

  Future register(String email, String password) async {
    Future result;
    try{
      result = _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      _success = true;
      return result;
    }catch(e){
      stderr.writeln(e.toString());
      _success = false;
    }
  }

  Future login(String email, String password){
    Future result;
    try{
      result = _firebaseAuth.signInWithRedirect(googleAuthProvider);
      _success=true;
    }catch(e){
      stderr.writeln(e.toString());
      _success = false;
    }
  }

  Future logout(){
    try{
      _firebaseAuth.signOut();
      _success = false;
    }catch(e){
      stderr.writeln(e.toString());
    }
  }

  bool isSuccess(){
    return _success;
  }
}