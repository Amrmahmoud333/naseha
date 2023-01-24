import 'package:flutter/material.dart';
import 'package:naseha/views/shared/size.dart';

class UserInfomation extends StatelessWidget {
  const UserInfomation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Padding(
      padding:
          EdgeInsets.only(top: size.h(2), right: size.w(8), left: size.w(8)),
      child: InkWell(
        // onTap: () {
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: ((context) => const ProfileScreen())));
        // },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const NetworkImage(
                  'https://avatars.githubusercontent.com/u/60432384?v=4'),
            ),
            SizedBox(width: size.h(15)),
            // TODO name
            Padding(
              padding: EdgeInsets.only(top: size.h(8)),
              child: const Text(
                'Amr Mahmoud',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
