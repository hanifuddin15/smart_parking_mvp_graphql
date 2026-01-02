import 'base_model.dart';

class UserModel extends BaseModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }
}
