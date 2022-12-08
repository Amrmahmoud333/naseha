import 'package:flutter/material.dart';
import 'package:naseha/views/news_feed/widgets/custom_tag.dart';

class TagList extends StatelessWidget {
  const TagList({Key? key, required this.color, required this.text})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return InkWell(
      onTap: () {},
      child: SizedBox(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(w(80), (w(80) * 0.3333333333333333).toDouble()),
                  painter: CustomPainterTag(tagColor: color),
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
