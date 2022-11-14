import 'package:flutter/material.dart';
import 'package:naseha/views/shared/rounded_clipper.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool emailValidator({required String email}) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return ClipPath(
      clipper: RoundedClipper(),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: h(400),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: h(90)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: w(20)),
                child: TextFormField(
                  controller: emailController,
                  validator: (email) => emailValidator(email: email!)
                      ? 'Enter a valid email'
                      : null,
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
                padding:
                    EdgeInsets.only(left: w(20), right: w(20), bottom: h(10)),
                child: const Divider(
                  color: Color(0xff336B87),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: w(20)),
                child: TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((value) => value != null && value.length > 7
                      ? 'Enter more than 7 characters'
                      : null),
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
                padding:
                    EdgeInsets.only(left: w(20), right: w(20), bottom: h(10)),
                child: const Divider(
                  color: Color(0xff336B87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
