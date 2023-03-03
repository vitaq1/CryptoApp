import 'dart:developer';

import 'package:hive/hive.dart';

import '../../data/datasource/local/entity/UserEntity/UserEntity.dart';

class User {
  User({
    required this.name,
    required this.lastName,
    required this.location,
    required this.avatarUrl,
  });

  late String name;
  late String lastName;
  late String location;
  late String avatarUrl;


  UserEntity toUserEntity() {
    return UserEntity()
      ..name = name
      ..lastName = lastName
      ..location = location
      ..avatarUrl = avatarUrl;
  }

  User.fromEntity(UserEntity entity){
    name = entity.name;
    lastName = entity.lastName;
    location = entity.location;
    avatarUrl = entity.avatarUrl;
  }


}