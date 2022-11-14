import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool emailValidator({required String email}) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return Scaffold(
      backgroundColor: const Color(0xff90AFC5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: AutoSizeText(
            'إعادة تعيين كلمة السر',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      labelText: 'برجاء ادخال بريدك الالكتروني'),
                  validator: (email) => emailValidator(email: email!)
                      ? 'Enter a valid email'
                      : null,
                ),
                SizedBox(height: h(20)),
                BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  return ElevatedButton.icon(
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
                    icon: const Icon(Icons.email_outlined),
                    label: const AutoSizeText('إعادة تعيين كلمة السر'),
                    onPressed: () async {
                      await context.read<AuthCubit>().forgetPassword(
                          email: emailController.text.trim(), context: context);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
