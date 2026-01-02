class PostMutations {
  static const String createPost = r'''
    mutation CreatePost($title: String!, $content: String!) {
      createPost(title: $title, content: $content) {
        id
        title
        content
      }
    }
  ''';
}
