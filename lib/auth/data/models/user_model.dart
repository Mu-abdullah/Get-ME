import '../../../core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.createAt,
    required super.name,
    required super.mail,
    required super.phone,
    required super.verified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        createAt: json['create_at'],
        name: json['name'],
        mail: json['mail'],
        phone: json['phone'],
        verified: json['verified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'create_at': createAt,
        'name': name,
        'mail': mail,
        'phone': phone,
        'verified': verified,
      };
}
