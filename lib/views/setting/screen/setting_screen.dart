import 'package:flutter/material.dart';
import 'package:naseha/views/shared/custom_text_field.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

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
            size: w(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[350],
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h(8), horizontal: w(8)),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(height: h(10)),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: w(130),
                        height: h(130),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: w(1),
                            color: Colors.black,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: w(1),
                              blurRadius: 1,
                              color: Colors.black54,
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/60432384?v=4'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: h(40),
                            width: w(40),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: w(2),
                              ),
                              color: Colors.grey[300],
                            ),
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h(35)),
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
                SizedBox(height: h(25)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: h(45),
                    width: w(141),
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
