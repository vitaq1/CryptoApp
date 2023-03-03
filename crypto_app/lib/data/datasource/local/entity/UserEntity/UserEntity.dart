import 'dart:developer';

import 'package:hive/hive.dart';
part 'UserEntity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends HiveObject {

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String lastName;

  @HiveField(2)
  late String location;

  @HiveField(3)
  late String avatarUrl;

}