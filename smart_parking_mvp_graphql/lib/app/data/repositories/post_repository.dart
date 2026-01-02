import 'package:smart_parking_mvp_graphql/app/data/datasources/graphql_datasource.dart';
import 'package:smart_parking_mvp_graphql/app/data/models/post_model.dart';

class PostRepository {
  final GraphqlDatasource _datasource;

  PostRepository(this._datasource);

  Future<List<PostModel>> getPosts() async {
    final response = await _datasource.getPosts();
    final List data = response.data['data']['posts'];
    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  Future<PostModel> createPost(String title, String content) async {
    final response = await _datasource.createPost(title, content);
    final data = response.data['data']['createPost'];
    return PostModel.fromMap(data);
  }
}
