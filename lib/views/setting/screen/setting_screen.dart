import 'package:flutter/material.dart';
import 'package:naseha/views/setting/widget/change_avatar.dart';
import 'package:naseha/views/shared/custom_text_field.dart';
import 'package:naseha/views/shared/size.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'الإعدادت',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: size.w(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[350],
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: size.h(8), horizontal: size.w(8)),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(height: size.h(10)),
                const ChangeAvatar(),
                SizedBox(height: size.h(35)),
                const CustomTextField(
                    text: 'الاسم', hint: 'الاسم', isPassword: false),
                const CustomTextField(
                    text: 'البريد الإكتروني',
                    hint: 'البريد الإلكتروني',
                    isPassword: false),
                const CustomTextField(
                    text: 'كلمة المرور', hint: '*******', isPassword: true),
                const CustomTextField(
                    text: 'الاسم', hint: 'الاسم', isPassword: false),
                SizedBox(height: size.h(25)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.h(45),
                    width: size.w(141),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    child: Center(
                      child: Text(
                        'حفظ',
                        style: TextStyle(fontSize: 22, color: Colors.grey[200]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
