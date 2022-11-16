// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naseha/data/repositories/firebase_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthRepo _firebaseAuthRepo;
  AuthCubit(this._firebaseAuthRepo) : super(AuthInitial());

  User? user;
  Future login(
      {required String email,
      required String password,
      BuildContext? context}) async {
    emit(LoginLoading());
    try {
      await _firebaseAuthRepo.login(email: email, password: password);
      user = FirebaseAuth.instance.currentUser;
      emit(LoginSccuess());
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text('هناك خطأ بالبريد الالكتروني أو كلمة المرور')));
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
      print('object');
      emit(RegisterSccuess());
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      emit(RegisterError());
    }
  }

  Future forgetPassword({required String email, BuildContext? context}) async {
    emit(ForegetPasswordLoading());
    try {
      await _firebaseAuthRepo.forgetPaassword(email: email);
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text('تم إرسال كلمة المور الي البريد الالكتروني')));
      emit(ForegetPasswordSccuess());
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text('لا يوجد مستخدم بهذا البريد الالكتروني')));
      print(error.toString());
      emit(ForegetPasswordError());
    }
  }

  Future sendEmailVerification() async {
    emit(SendVerificationEmailLoading());
    try {
      await _firebaseAuthRepo.sendVerificationEmail();

      emit(SendVerificationEmailSccuess());
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      emit(SendVerificationEmailError());
    }
  }
}
