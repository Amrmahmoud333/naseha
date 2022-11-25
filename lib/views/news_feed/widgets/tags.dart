import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({
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

    return Row(
      children: [
        // TODO make it dynamic
        SizedBox(width: w(20)),
        Padding(
          padding: EdgeInsets.only(top: h(3), bottom: h(3)),
          child: Container(
            width: w(100),
            height: h(25),
            color: Colors.black54,
            child: const Center(
                child: AutoSizeText(
              'سفر',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
