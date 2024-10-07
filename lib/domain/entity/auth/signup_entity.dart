class UserSignupEntity {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  UserSignupEntity(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmPassword});
}
