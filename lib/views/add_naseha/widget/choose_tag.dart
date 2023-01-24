import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/add_naseha/widget/tag_list.dart';
import 'package:naseha/views/shared/size.dart';

class ChooseTag extends StatelessWidget {
  const ChooseTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    NasehaCubit cubit = context.read<NasehaCubit>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('عن ماذا تتحدث؟'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.h(25)),
              Row(
                children: const [
                  TagList(text: 'رياضة'),
                  TagList(text: 'كورة قدم'),
                  TagList(text: 'تسوق'),
                ],
              ),
              SizedBox(height: size.h(25)),
              Row(
                children: const [
                  TagList(text: 'هندسة'),
                  TagList(text: 'برمجة'),
                  TagList(text: 'دين'),
                ],
              ),
              SizedBox(height: size.h(25)),
              Row(
                children: const [
                  TagList(text: 'تعليم'),
                  TagList(text: 'سياحة'),
                  TagList(text: 'سفر'),
                ],
              ),
              SizedBox(height: size.h(25)),
              const Text(
                'اضافة وسم غير موجود',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              TextField(
                onChanged: ((value) {
                  cubit.setNewTag(text: value);
                }),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.h(15), horizontal: size.w(25)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(size.w(32))),
                  ),
                ),
              ),
              SizedBox(height: size.h(10)),
              ElevatedButton(
                onPressed: () {
                  cubit.chooseTags(cubit.addNewTag!);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: size.h(10)),
              // choosen tags
              BlocBuilder<NasehaCubit, NasehaState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int i = 0; i < cubit.tags!.length; i++)
                        TagList(text: cubit.tags![i]),
                    ],
                  );
                },
              ),
              BlocBuilder<NasehaCubit, NasehaState>(
                builder: (context, state) {
                  return !cubit.numberOfTags
                      ? const Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'لا يمكنك اختيار أكثر من ثلاث أوسام',
                            style: TextStyle(color: Colors.redAccent),
                          ))
                      : const SizedBox();
                },
              ),
              SizedBox(height: size.h(25)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
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
