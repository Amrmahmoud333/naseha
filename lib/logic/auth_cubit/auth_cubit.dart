// ignore_for_file: avoid_print

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:naseha/data/repositories/firebase_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthRepo _firebaseAuthRepo;
  AuthCubit(this._firebaseAuthRepo) : super(AuthInitial());

  User? user;
  Future login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _firebaseAuthRepo.login(email: email, password: password);
      user = FirebaseAuth.instance.currentUser;
      emit(LoginSccuess());
    } on FirebaseAuthException catch (error) {
      print(error);
      emit(LoginError());
    } catch (error) {
      print(error);
    }
  }

  Future logout() async {
    emit(LogoutLoading());
    try {
      await _firebaseAuthRepo.logout();
      emit(LogoutSccuess());
    } on FirebaseAuthException catch (error) {
      print(error);
      emit(LogoutError());
    } catch (error) {
      print(error);
      emit(LogoutError());
    }
  }

  Future register({required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await _firebaseAuthRepo.register(email: email, password: password);
      emit(RegisterSccuess());
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      emit(RegisterError());
    }
  }
}
