import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';
import 'package:naseha/views/auth/register/screens/register_screen.dart';
import 'package:naseha/views/shared/rounded_clipper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      body: Container(
        color: const Color(0xff90AFC5),
        child: ListView(
          children: [
            SizedBox(height: h(30)),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  // logo
                  'https://icons-for-free.com/download-icon-avatar+person+profile+user+icon-1320166578424287581_512.png'),
              maxRadius: 50,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: h(20)),
            Container(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: RoundedClipper(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: h(400),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: h(90)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: w(20)),
                            child: TextField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'البريد الالكتروني',
                                helperStyle: TextStyle(
                                  color: Colors.blue.shade200,
                                ),
                                border: InputBorder.none,
                                icon: const Icon(
                                  Icons.email,
                                  color: Color(0xff336B87),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: w(20), right: w(20), bottom: h(10)),
                            child: const Divider(
                              color: Color(0xff336B87),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: w(20)),
                            child: TextField(
                              controller: passwordController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'كلمة المرور',
                                helperStyle: TextStyle(
                                  color: Colors.blue.shade200,
                                ),
                                border: InputBorder.none,
                                icon: const Icon(
                                  Icons.lock,
                                  color: Color(0xff336B87),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: w(20), right: w(20), bottom: h(10)),
                            child: const Divider(
                              color: Color(0xff336B87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xff336B87),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h(420),
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xff336B87),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            child: state is LoginLoading
                                ? SizedBox(
                                    width: w(12),
                                    height: h(12),
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
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                child: const AutoSizeText(
                  'إنشاء حساب',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
