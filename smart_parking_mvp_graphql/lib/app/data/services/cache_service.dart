import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_parking_mvp_graphql/app/data/models/user_model.dart';

class CacheService extends GetxService {
  final _box = GetStorage();
  final _tokenKey = 'accessToken';
  final _refreshTokenKey = 'refreshToken';
  final _userKey = 'userData';

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _box.write(_tokenKey, accessToken);
    await _box.write(_refreshTokenKey, refreshToken);
  }

  String? getAccessToken() {
    return _box.read(_tokenKey);
  }

  String? getRefreshToken() {
    return _box.read(_refreshTokenKey);
  }

  Future<void> saveUser(UserModel user) async {
    await _box.write(_userKey, user.toMap());
  }

  UserModel? getUser() {
    final userData = _box.read(_userKey);
    if (userData != null) {
      return UserModel.fromMap(userData);
    }
    return null;
  }

  Future<void> clearSession() async {
    await _box.remove(_tokenKey);
    await _box.remove(_refreshTokenKey);
    await _box.remove(_userKey);
  }

  bool get isLoggedIn => getAccessToken() != null;
}
