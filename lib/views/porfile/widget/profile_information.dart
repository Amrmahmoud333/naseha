import 'package:flutter/material.dart';
import 'package:naseha/views/shared/size.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: size.h(8), horizontal: size.w(32)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.w(10))),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text('متابعين'),
                  SizedBox(height: size.h(8)),
                  const Text('500'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('يتابع'),
                  SizedBox(height: size.h(8)),
                  const Text('16'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('النصائح'),
                  SizedBox(height: size.h(8)),
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
