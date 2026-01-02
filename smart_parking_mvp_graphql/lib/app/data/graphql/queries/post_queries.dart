class PostQueries {
  static const String getPosts = r'''
    query GetPosts {
      posts {
        id
        title
        content
      }
    }
  ''';

  static const String getPost = r'''
    query GetPost($id: ID!) {
      post(id: $id) {
        id
        title
        content
      }
    }
  ''';
}
