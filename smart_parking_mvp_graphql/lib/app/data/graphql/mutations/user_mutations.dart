class UserMutations {
  static const String updateUser = r'''
    mutation UpdateUser($id: ID!, $name: String!) {
      updateUser(id: $id, name: $name) {
        id
        name
        email
      }
    }
  ''';
}
