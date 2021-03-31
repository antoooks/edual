import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet{
  int walletId;
  double points;
  List<String> history;

  DocumentReference reference;

  Wallet(this.walletId,this.points,this.history,{this.reference});

  static fromJson(Map<dynamic, dynamic> json) => _WalletFromJson(json);

  Map<String, dynamic> toJson() => _WalletToJson(this);

  @override
  String toString() => "Wallet<$walletId,$points,$history>";

  static Wallet _WalletFromJson(Map<dynamic, dynamic> json){
    return Wallet(
      json['walletId'] as int,
      json['points'] as double,
      json['history'] as List<String>,
    );
  }

  Map<String,dynamic> _WalletToJson(Wallet instance){
    return <String,dynamic>{
      'walletId': instance.walletId,
      'points': instance.points,
      'history': instance.history,
    };
  }
}