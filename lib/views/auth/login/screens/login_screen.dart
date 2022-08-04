import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:naseha/views/auth/login/widgets/elevated_login_button.dart';
import 'package:naseha/views/auth/login/widgets/login_form.dart';
import 'package:naseha/views/shared/logo_widget.dart';
import 'package:naseha/views/shared/person_container.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onClickedRegister;
  LoginScreen({Key? key, required this.onClickedRegister}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return Scaffold(
      body: Container(
        color: const Color(0xff90AFC5),
        child: ListView(
          children: [
            SizedBox(height: h(30)),
            const LogoWidget(),
            SizedBox(height: h(20)),
            Container(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  LoginFormWidget(
                      emailController: emailController,
                      passwordController: passwordController),
                  const PersonContainer(),
                  ElevatedLoginButton(
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
                    text: 'لا تمتلك حساب؟ ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = onClickedRegister,
                        text: 'إنشاء حساب',
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
