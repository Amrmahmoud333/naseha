import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';
import 'package:naseha/views/shared/size.dart';

class ElevatedLoginButton extends StatelessWidget {
  const ElevatedLoginButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return SizedBox(
      height: size.h(420),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff336B87),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      color: Color(0xff336B87),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                context.read<AuthCubit>().login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    context: context);
              },
              child: state is LoginLoading
                  ? SizedBox(
                      width: size.w(12),
                      height: size.h(12),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const AutoSizeText(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 18),
                    ),
            ),
          );
        },
      ),
    );
  }
}
