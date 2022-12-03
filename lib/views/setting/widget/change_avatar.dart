import 'package:flutter/material.dart';

class ChangeAvatar extends StatelessWidget {
  const ChangeAvatar({
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

    return Center(
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
    );
  }
}
