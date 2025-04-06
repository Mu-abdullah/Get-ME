import 'package:getme/core/entities/user_entity.dart';

class CreateUserModel extends UserEntity {
  CreateUserModel({
    required super. name,
    required super. phone,
    required super. mail,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return CreateUserModel(
      name: json['name'],
      phone: json['phone'],
      mail: json['mail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'mail': mail,
    };
  }
}
