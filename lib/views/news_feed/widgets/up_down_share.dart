import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UpDownShare extends StatelessWidget {
  const UpDownShare({
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
              height: h(55),
              width: w(340 / 3),
              child: Column(
                children: const [
                  Icon(Icons.arrow_circle_up),
                  AutoSizeText('10'),
                ],
              )),
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: h(55),
            width: w(340 / 3),
            child: Column(
              children: const [
                Icon(Icons.arrow_circle_down),
                AutoSizeText('10')
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: h(55),
            width: w(340 / 3),
            child: Column(
              children: const [Icon(Icons.share), AutoSizeText('مشاركة')],
            ),
          ),
        ),
      ],
    );
  }
}
