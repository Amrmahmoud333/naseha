import 'package:flutter/material.dart';

class PersonContainer extends StatelessWidget {
  const PersonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff336B87),
          child: Icon(
            Icons.person,
            size: 50,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
