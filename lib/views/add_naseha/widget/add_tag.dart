import 'package:flutter/material.dart';
import 'package:naseha/views/news_feed/widgets/custom_tag.dart';

class AddTag extends StatelessWidget {
  const AddTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      width: w(355),
      height: h(66),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurStyle: BlurStyle.inner,
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(-2, -3),
          )
        ],
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: ((context) {
                return ChooseTag();
              }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: w(10)),
            const Text(
              'الهاشتاج',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseTag extends StatelessWidget {
  const ChooseTag({
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('عن ماذا تتحدث؟'),
        content: Column(
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    TagList(color: Colors.black, text: 'تعليم'),
                    TagList(color: Colors.red, text: 'سياحة'),
                    TagList(color: Colors.green, text: 'سفر'),
                  ],
                ),
                SizedBox(height: h(25)),
                Row(
                  children: const [
                    TagList(color: Colors.black, text: 'رياضة'),
                    TagList(color: Colors.red, text: 'كورة قدم'),
                    TagList(color: Colors.green, text: 'تسوق'),
                  ],
                ),
                SizedBox(height: h(25)),
                Row(
                  children: const [
                    TagList(color: Colors.black, text: 'هندسة'),
                    TagList(color: Colors.red, text: 'برمجة'),
                    TagList(color: Colors.green, text: 'دين'),
                  ],
                ),
                SizedBox(height: h(25)),
                Row(
                  children: const [
                    TagList(color: Colors.black, text: 'سفر'),
                    TagList(color: Colors.red, text: 'سفر'),
                    TagList(color: Colors.green, text: 'سفر'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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

    return SizedBox(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(w(80), (w(80) * 0.3333333333333333).toDouble()),
                painter: FirstTag(tagColor: color),
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
