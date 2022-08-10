import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';
import 'package:naseha/views/home_page/home_page.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      context.read<AuthCubit>().sendEmailVerification();

      timer = Timer.periodic(const Duration(seconds: 3), (_) async {
        await FirebaseAuth.instance.currentUser!.reload();
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });
    }

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const HomePage()
        : Scaffold(
            backgroundColor: const Color(0xff90AFC5),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const AutoSizeText('تأكيد البريد الإلكتروني'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText(
                    'تم إرسال رسالة تأكيد الي البريد الاكتروني, الرجاء التحقق منه',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthCubit>().sendEmailVerification();
                    },
                    icon: const Icon(Icons.email_outlined),
                    label: const AutoSizeText('ارسال رسالة أخري'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
