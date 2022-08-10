abstract class FirebaseAuthRepo {
  Future<void> login({required String email, required String password});
  Future<void> logout();
  Future<void> register({required String email, required String password});

  Future<void> forgetPaassword({required String email});

  Future<void> sendVerificationEmail();
}
