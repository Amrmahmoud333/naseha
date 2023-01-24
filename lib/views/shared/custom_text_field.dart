import 'package:flutter/material.dart';
import 'package:naseha/views/shared/size.dart';

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
    final Sizer size = Sizer(context: context);

    return Padding(
      padding: EdgeInsets.only(
          bottom: size.h(35), right: size.w(12), left: size.w(12)),
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
          contentPadding: EdgeInsets.only(bottom: size.h(3)),
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
