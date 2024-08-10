// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '/utils/user_shared_preferences.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String uid;
  String? login;
  bool? gender;
  num? weight;
  num? height;
  num? age;
  num? pal;

  UserModel({
    this.uid = "",
    this.login,
    this.gender,
    this.weight,
    this.height,
    this.age,
    this.pal,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) => UserModel(
        uid: snap.id,
        login: snap.data().toString().contains('login')
            ? snap['login'] as String?
            : "",
        gender: snap.data().toString().contains('gender')
            ? snap['gender'] as bool?
            : true,
        weight: snap.data().toString().contains('weight')
            ? snap['weight'] as num?
            : 0,
        height: snap.data().toString().contains('height')
            ? snap['height'] as num?
            : 0,
        age: snap.data().toString().contains('age') ? snap['age'] as num? : 0,
        pal: snap.data().toString().contains('pal') ? snap['pal'] as num? : 0,
      );

  static UserModel fromSharedPreferences() => UserModel(
        uid: UserSharedPreferences.getUserUID() ?? "",
        login: UserSharedPreferences.getUserLogin(),
        gender: UserSharedPreferences.getUserGender(),
        weight: UserSharedPreferences.getUserWeight(),
        height: UserSharedPreferences.getUserHeight(),
        age: UserSharedPreferences.getUserAge(),
        pal: UserSharedPreferences.getUserPAL(),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login ?? "",
      'gender': gender ?? true,
      'weight': weight ?? 0,
      'height': height ?? 0,
      'age': age ?? 0,
      'pal': pal ?? 0,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        uid,
        login,
        gender,
        weight,
        height,
        age,
        pal,
      ];
}
