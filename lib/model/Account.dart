import 'package:cloud_firestore/cloud_firestore.dart';

class Account{
  String name;
  String password;
  bool isParent;
  List<dynamic> kidAccounts = List<dynamic>();
  int walletId;
  int age;

  DocumentReference reference;

  Account(this.name, this.password, this.isParent, this.kidAccounts, this.walletId, this.age, {this.reference});

  factory Account.fromSnapshot(DocumentSnapshot snapshot){
    Account account = Account.fromJson(snapshot.data());
    account.reference = snapshot.reference;
    return account;
  }

  static Account fromJson(Map<dynamic,dynamic> json) => _AccountFromJson(json);

  Map<String, dynamic> toJson() => _AccountToJson(this);

  @override
  String toString() => "Account<$name,$isParent,$kidAccounts,$walletId,$age>";

  static Account _AccountFromJson(Map<dynamic, dynamic> json) {
    return Account(
      json['name'] as String,
      json['password'] as String,
      json['isParent'] as bool,
      json['kidAccounts'] as List,
      json['walletId'] as int,
      json['age'] as int,
    );
  }

  Map<dynamic, dynamic> _AccountToJson(Account instance){
    return <dynamic,dynamic>{
      'name': instance.name,
      'password': instance.password,
      'isParent': instance.isParent,
      'kidAccounts': instance.kidAccounts,
      'walletId': instance.walletId,
      'age': instance.age,
    };
  }

  static List<Account> _convertAccount(List accountMap){
    if(accountMap.isEmpty){
      return null;
    }
    List<Account> accounts = List<Account>();
    accountMap.forEach((value) {
      accounts.add(Account.fromJson(value));
    });
    return accounts;
  }

  List<String> _AccountList(List<String> accounts){
    if(accounts==null){
      return null;
    }
    List<String> accountMap = List<String>();
    accounts.forEach((value) {
      accountMap.add(value);
    });
    return accountMap;
  }
}