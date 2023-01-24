import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:naseha/views/shared/size.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key, required this.text, required this.tagColor})
      : super(key: key);
  final Color tagColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Row(
      children: [
        SizedBox(width: size.w(20)),
        Padding(
          padding: EdgeInsets.only(top: size.h(3), bottom: size.h(3)),
          child: Container(
            width: size.w(100),
            height: size.h(25),
            color: tagColor,
            child: Center(
                child: AutoSizeText(
              text,
              style: const TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
