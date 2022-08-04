import 'package:firebase_auth/firebase_auth.dart';
import 'package:naseha/data/repositories/firebase_auth_repo.dart';

class FirebaseServicesAuth extends FirebaseAuthRepo {
  @override
  Future<void> login({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future logout() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> register(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
