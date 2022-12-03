import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text, hint;
  final bool isPassword;
  const CustomTextField(
      {Key? key,
      required this.text,
      required this.hint,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: h(35), right: w(12), left: w(12)),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    // isPassword = !isPassword
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: h(3)),
          labelText: text,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          helperStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
