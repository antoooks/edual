import 'dart:io';

import 'package:edual/model/Account.dart';
import 'package:edual/service/BaseAuthService.dart';
import 'package:edual/service/EmailAuthService.dart';
import 'package:edual/service/GoogleAuthService.dart';
import 'package:flutter/foundation.dart';

enum ServiceProvider {
  EMAIL, GOOGLE
}

class AuthProvider extends ChangeNotifier{
  Account account;
  static BaseAuthService _authService;

  AuthProvider({ServiceProvider provider}){
    switch(provider){
      case ServiceProvider.EMAIL:
        _authService = EmailAuthService();
        break;
      case ServiceProvider.GOOGLE:
        _authService = GoogleAuthService();
        break;
      default:
        throw Exception("SERVICE_PROVIDER_UNKNOWN");
    }
  }

  Account register(String email, password){
    try{
      _authService.register(email, password);
      if(_authService.isSuccess()){
        return account;
      }else{
         return null;
      }
    }catch(e){
      stderr.writeln(e.toString());
      return null;
    }
  }

  Account login(String email, password){
    try{
      _authService.login(email, password);
      if(_authService.isSuccess()){
        return account;
      }else{
        return null;
      }
    }catch(e){
      stderr.writeln(e.toString());
      return null;
    }
  }

  void logout(){
    try{
      _authService.logout();
    }catch(e){
      stderr.writeln(e.toString());
      return null;
    }
  }

  bool isSuccess(){
    return _authService.isSuccess();
  }
}