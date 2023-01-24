import 'package:flutter/material.dart';
import 'package:naseha/views/shared/size.dart';

class ChangeAvatar extends StatelessWidget {
  const ChangeAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Center(
      child: Stack(
        children: [
          Container(
            width: size.w(130),
            height: size.h(130),
            decoration: BoxDecoration(
              border: Border.all(
                width: size.w(1),
                color: Colors.black,
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: size.w(1),
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
                height: size.h(40),
                width: size.w(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: size.w(2),
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
