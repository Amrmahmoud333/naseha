import 'package:flutter/material.dart';
import 'package:naseha/views/auth/login/screens/login_screen.dart';
import 'package:naseha/views/auth/register/screens/register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginScreen(onClickedRegister: toggle);
    } else {
      return RegisterScreen(onClickedLogin: toggle);
    }
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
