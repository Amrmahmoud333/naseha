abstract class FirebaseAuthRepo {
  Future<void> login(String email, String password);
  Future<void> logout();
}
