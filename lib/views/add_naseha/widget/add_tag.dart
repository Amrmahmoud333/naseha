import 'package:flutter/material.dart';
import 'package:naseha/views/news_feed/widgets/tags.dart';

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
                return const ChooseTag();
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
            SizedBox(
              width: w(200),
              child: DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 'stv',
                    child: Text('سفر'),
                  ),
                  DropdownMenuItem(
                    value: 'stv',
                    child: Text('سفر'),
                  ),
                ],
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
