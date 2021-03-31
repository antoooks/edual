import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edual/model/Account.dart';
import 'package:edual/service/AccountService.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class AccountProvider extends ChangeNotifier {
  AccountService _api = locator<AccountService>();
  List<Account> account;

  Future<List<Account>> fetchAccounts() async {
    var result = await _api.getDataCollection();
    account = result.docs
        .map((doc) => Account.fromJson(doc.data()))
        .toList();
    return account;
  }

  Stream<QuerySnapshot> fetchAccountsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Account> getAccountById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Account.fromJson(doc.data()) ;
  }

  Future removeAccount(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateAccount(Account data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addAccount(Account data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result;
  }
}