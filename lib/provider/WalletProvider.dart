import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edual/model/Wallet.dart';
import 'package:edual/service/WalletService.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class WalletProvider extends ChangeNotifier {
  WalletService _api = locator<WalletService>();
  List<Wallet> wallet;

  Future<List<Wallet>> fetchWallets() async {
    var result = await _api.getDataCollection();
    wallet = result.docs
        .map((doc) => Wallet.fromJson(doc.data()))
        .toList();
    return wallet;
  }

  Stream<QuerySnapshot> fetchWalletsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Wallet> getWalletById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Wallet.fromJson(doc.data()) ;
  }

  Future removeWallet(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }

  Future updateWallet(Wallet data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addWallet(Wallet data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result;
  }

  Future assignWalletToAccount(String accountId, String walletId){

  }
}