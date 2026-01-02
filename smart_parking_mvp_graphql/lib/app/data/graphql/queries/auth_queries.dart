class AuthQueries {
  static const String getUserProfile = r'''
    query GetUserProfile {
      me {
        id
        name
        email
      }
    }
  ''';
}
