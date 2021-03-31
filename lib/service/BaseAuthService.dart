import 'package:flutter/foundation.dart';

class BaseAuthService {
  Future register(String email, String password){}
  Future login(String email, String password){}
  void logout(){}
  bool isSuccess(){}
}