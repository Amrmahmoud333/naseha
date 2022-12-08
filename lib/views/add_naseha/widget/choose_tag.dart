import 'package:flutter/material.dart';
import 'package:naseha/views/add_naseha/widget/tag_list.dart';

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
        content: SingleChildScrollView(
          child: Column(
            children: [
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
                  TagList(color: Colors.black, text: 'رياضة'),
                  TagList(color: Colors.red, text: 'كرة قدم'),
                  TagList(color: Colors.green, text: 'تسوق'),
                ],
              ),
              SizedBox(height: h(25)),
              const Text(
                'اضافة وسم غير موجود',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: h(15), horizontal: w(25)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(w(32))),
                  ),
                ),
              ),
              SizedBox(height: h(10)),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: h(10)),
              // choosen tags
              Row(
                children: const [
                  TagList(color: Colors.black, text: 'رياضة'),
                  TagList(color: Colors.red, text: 'كرة قدم'),
                  TagList(color: Colors.green, text: 'تسوق'),
                ],
              ),
              SizedBox(height: h(25)),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
                child: const Text(
                  'تأكيد',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
