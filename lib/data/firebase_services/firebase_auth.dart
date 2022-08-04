import 'package:firebase_auth/firebase_auth.dart';
import 'package:naseha/data/repositories/firebase_auth_repo.dart';

class FirebaseServicesAuth extends FirebaseAuthRepo {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
