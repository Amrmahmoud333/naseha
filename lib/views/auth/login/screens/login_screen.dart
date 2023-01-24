import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:naseha/views/auth/login/widgets/elevated_login_button.dart';
import 'package:naseha/views/auth/login/widgets/login_form.dart';
import 'package:naseha/views/forget_password/forget_password_screen.dart';
import 'package:naseha/views/shared/logo_widget.dart';
import 'package:naseha/views/shared/person_container.dart';
import 'package:naseha/views/shared/size.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onClickedRegister;
  LoginScreen({Key? key, required this.onClickedRegister}) : super(key: key);

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
              child: GestureDetector(
                child: const AutoSizeText(
                  'نسيت كلمة السر',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => ForgetPasswordScreen()),
                  ));
                },
              ),
            ),
            SizedBox(height: size.h(10)),
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
