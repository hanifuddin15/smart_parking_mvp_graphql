import 'package:smart_parking_mvp_graphql/app/data/datasources/graphql_datasource.dart';
import 'package:smart_parking_mvp_graphql/app/data/models/user_model.dart';
import 'package:smart_parking_mvp_graphql/app/data/services/cache_service.dart';

class AuthRepository {
  final GraphqlDatasource _datasource;
  final CacheService _cacheService;

  AuthRepository(this._datasource, this._cacheService);

  Future<UserModel> login(String email, String password) async {
    final response = await _datasource.login(email, password);
    final data = response.data['data']['login']['data'];
    final accessToken = data['tokens']['accessToken'];
    final refreshToken = data['tokens']['refreshToken'];
    final user = data['user'];
    
    await _cacheService.saveTokens(accessToken, refreshToken);
    final userModel = UserModel.fromMap(user);
    await _cacheService.saveUser(userModel);
    
    return userModel;
  }

  Future<UserModel> register(String name, String email, String password) async {
    final response = await _datasource.register(name, email, password);
    final data = response.data['data']['register']['user'];
    return UserModel.fromMap(data);
  }

  Future<void> logout() async {
    await _cacheService.clearSession();
  }

  UserModel? get currentUser => _cacheService.getUser();
}
