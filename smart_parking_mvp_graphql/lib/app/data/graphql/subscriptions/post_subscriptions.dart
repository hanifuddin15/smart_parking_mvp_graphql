class PostSubscriptions {
  static const String postAdded = r'''
    subscription PostAdded {
      postAdded {
        id
        title
        content
      }
    }
  ''';
}
