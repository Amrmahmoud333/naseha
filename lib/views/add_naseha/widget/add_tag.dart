import 'package:flutter/material.dart';
import 'package:naseha/views/add_naseha/widget/choose_tag.dart';

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
