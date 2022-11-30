import 'package:flutter/material.dart';
import 'package:naseha/views/setting/screen/setting_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: w(35)),
          const Text(
            'الصفحة الشخصية',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          IconButton(
              icon: Icon(
                Icons.settings,
                size: w(25),
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SettingScreen())));
              }),
        ],
      ),
    );
  }
}
