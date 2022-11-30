import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: h(8), horizontal: w(32)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w(10))),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text('متابعين'),
                  SizedBox(height: h(8)),
                  const Text('500'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('يتابع'),
                  SizedBox(height: h(8)),
                  const Text('16'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('النصائح'),
                  SizedBox(height: h(8)),
                  const Text('6'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
