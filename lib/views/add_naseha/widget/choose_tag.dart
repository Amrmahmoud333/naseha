import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
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

    NasehaCubit cubit = context.read<NasehaCubit>();
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
                  TagList(text: 'رياضة'),
                  TagList(text: 'كورة قدم'),
                  TagList(text: 'تسوق'),
                ],
              ),
              SizedBox(height: h(25)),
              Row(
                children: const [
                  TagList(text: 'هندسة'),
                  TagList(text: 'برمجة'),
                  TagList(text: 'دين'),
                ],
              ),
              SizedBox(height: h(25)),
              Row(
                children: const [
                  TagList(text: 'رياضة'),
                  TagList(text: 'كرة قدم'),
                  TagList(text: 'تسوق'),
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
              BlocBuilder<NasehaCubit, NasehaState>(
                builder: (context, state) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        for (int i = 0; i < cubit.tags!.length; i++)
                          TagList(text: cubit.tags![i]),
                      ],
                    ),
                  );
                },
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
