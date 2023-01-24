import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:naseha/views/auth/register/widgets/elevated_register_button.dart';
import 'package:naseha/views/auth/register/widgets/register_form.dart';
import 'package:naseha/views/shared/logo_widget.dart';
import 'package:naseha/views/shared/person_container.dart';
import 'package:naseha/views/shared/size.dart';

class RegisterScreen extends StatelessWidget {
  final VoidCallback onClickedLogin;
  RegisterScreen({Key? key, required this.onClickedLogin}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Scaffold(
      body: Container(
        color: const Color(0xff90AFC5),
        child: ListView(
          children: [
            SizedBox(height: size.h(30)),
            const LogoWidget(),
            SizedBox(height: size.h(20)),
            Container(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  RegisterFormWidget(
                      emailController: emailController,
                      passwordController: passwordController),
                  const PersonContainer(),
                  ElevatedRegisterButton(
                      emailController: emailController,
                      passwordController: passwordController),
                ],
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    style:
                        const TextStyle(fontSize: 18, color: Color(0xff2A3132)),
                    text: 'تمتلك حساب؟ ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = onClickedLogin,
                        text: 'تسجيل الدخول',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
