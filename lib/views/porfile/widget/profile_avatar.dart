import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return CircleAvatar(
        backgroundColor: Colors.black54,
        radius: w(80),
        child: CircleAvatar(
            radius: w(80 - 2),
            backgroundImage: const NetworkImage(
                'https://avatars.githubusercontent.com/u/60432384?v=4')));
  }
}
