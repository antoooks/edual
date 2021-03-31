import 'dart:io';

import 'package:edual/view/widget/AlertSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'BaseAuthService.dart';

class EmailAuthService implements BaseAuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _success = false;
 
  Future register(String email, String password){
    Future result;
    try{
      result = _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      _success=true;
      return result;
    }on FirebaseAuthException catch(e){
      if (e.code == 'account-exists-with-different-credential') {
        AlertSnackBar(message: e.message);
      } else if (e.code == 'invalid-credential') {
        AlertSnackBar(message: e.message);
      }
    } catch (e) {
      AlertSnackBar(message: e.toString());
      stderr.writeln(e.toString());
      _success=false;
    }
  }

  Future login(String email, String password){
    Future result;
    try{
      result = _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      _success=true;
      return result;
    }on FirebaseAuthException catch(e){
      if (e.code == 'account-exists-with-different-credential') {
        AlertSnackBar(message: e.message);
      } else if (e.code == 'invalid-credential') {
        AlertSnackBar(message: e.message);
      }
    } catch (e) {
      AlertSnackBar(message: e.toString());
      stderr.writeln(e.toString());
      _success=false;
    }
  }

  void logout(){
    Future result;
    try{
      _firebaseAuth.signOut();
      _success=false;
    }catch(e){
      stderr.writeln(e.toString());
      AlertSnackBar(message: e.toString());
    }
  }

  bool isSuccess(){
    return _success;
  }

}