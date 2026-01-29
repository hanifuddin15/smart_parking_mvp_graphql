class AuthMutations {
  static const String login = r'''
    mutation Login($email: String!, $password: String!) {
      login(input:{email: $email, password: $password}) {
      statusCode
      timestamp
        message
        data{
          tokens{
            accessToken
            refreshToken
          }
          user{
            id
            username
            email
          }
        }
      }
    }
  ''';

  static const String register = r'''
    mutation Register($name: String!, $email: String!, $password: String!) {
      register(name: $name, email: $email, password: $password) {
        token
        user {
          id
          name
          email
        }
      }
    }
  ''';
}
