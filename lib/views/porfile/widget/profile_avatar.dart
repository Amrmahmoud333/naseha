import 'package:flutter/material.dart';
import 'package:naseha/views/shared/size.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return CircleAvatar(
        backgroundColor: Colors.black54,
        radius: size.w(80),
        child: CircleAvatar(
            radius: size.w(80 - 2),
            backgroundImage: const NetworkImage(
                'https://avatars.githubusercontent.com/u/60432384?v=4')));
  }
}
