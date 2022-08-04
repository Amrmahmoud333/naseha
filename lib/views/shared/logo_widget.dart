import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
          // logo
          'https://icons-for-free.com/download-icon-avatar+person+profile+user+icon-1320166578424287581_512.png'),
      maxRadius: 50,
      backgroundColor: Colors.transparent,
    );
  }
}
