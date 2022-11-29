import 'package:flutter/material.dart';

class UserInfomation extends StatelessWidget {
  const UserInfomation({
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

    return Padding(
      padding: EdgeInsets.only(top: h(2), right: w(8), left: w(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: const NetworkImage(
                'https://avatars.githubusercontent.com/u/60432384?v=4'),
          ),
          SizedBox(width: h(15)),
          // TODO name
          Padding(
            padding: EdgeInsets.only(top: h(8)),
            child: const Text(
              'Amr Mahmoud',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
