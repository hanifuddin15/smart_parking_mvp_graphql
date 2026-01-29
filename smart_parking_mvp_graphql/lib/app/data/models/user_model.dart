import 'base_model.dart';

class UserModel extends BaseModel {
  final String id;
  final String name;
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final String profileImage;
  final String phone;
  final String status;
  final String role;
  final String siteId;
  final String organizationId;

  UserModel({required this.id, required this.name, required this.email, required this.firstName, required this.lastName, required this.username, required this.profileImage, required this.phone, required this.status, required this.role, required this.siteId, required this.organizationId});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      username: map['username'] ?? '',
      profileImage: map['profileImage'] ?? '',
      phone: map['phone'] ?? '',
      status: map['status'] ?? '',
      role: map['role'] ?? '',
      siteId: map['siteId'] ?? '',
      organizationId: map['organizationId'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'firstName': firstName, 'lastName': lastName, 'username': username, 'profileImage': profileImage, 'phone': phone, 'status': status, 'role': role, 'siteId': siteId, 'organizationId': organizationId};
  }
}
