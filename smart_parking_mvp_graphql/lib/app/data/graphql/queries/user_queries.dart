class UserQueries {
  static const String getUsers = r'''
    query GetUsers {
      users {
        id
        name
        email
      }
    }
  ''';
}
