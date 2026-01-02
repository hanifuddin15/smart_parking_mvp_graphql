import 'package:dio/dio.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_client.dart';
import 'package:smart_parking_mvp_graphql/app/data/graphql/mutations/auth_mutations.dart';
import 'package:smart_parking_mvp_graphql/app/data/graphql/queries/post_queries.dart';
import 'package:smart_parking_mvp_graphql/app/data/graphql/mutations/post_mutations.dart';
// import queries/mutations as needed

class GraphqlDatasource {
  final GraphqlClient _client;

  GraphqlDatasource(this._client);

  Future<Response> login(String email, String password) async {
    return await _client.performMutation(
      mutation: AuthMutations.login,
      variables: {'email': email, 'password': password},
    );
  }

  Future<Response> register(String name, String email, String password) async {
    return await _client.performMutation(
      mutation: AuthMutations.register,
      variables: {'name': name, 'email': email, 'password': password},
    );
  }

  Future<Response> getPosts() async {
    return await _client.performQuery(query: PostQueries.getPosts);
  }

  Future<Response> createPost(String title, String content) async {
    return await _client.performMutation(
      mutation: PostMutations.createPost,
      variables: {'title': title, 'content': content},
    );
  }
}
