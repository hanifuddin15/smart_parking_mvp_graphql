import 'package:smart_parking_mvp_graphql/app/data/datasources/graphql_datasource.dart';
import 'package:smart_parking_mvp_graphql/app/data/models/user_model.dart';

class AuthRepository {
  final GraphqlDatasource _datasource;

  AuthRepository(this._datasource);

  Future<UserModel> login(String email, String password) async {
    final response = await _datasource.login(email, password);
    final data = response.data['data']['login']['data'];
    final accessToken = data['tokens']['accessToken'];
    final refreshToken = data['tokens']['refreshToken'];
    final user = data['user'];
    // Save token if needed
    return UserModel.fromMap(user);
  }

  Future<UserModel> register(String name, String email, String password) async {
    final response = await _datasource.register(name, email, password);
    final data = response.data['data']['register']['user'];
    return UserModel.fromMap(data);
  }
}
