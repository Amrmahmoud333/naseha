import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/add_naseha/widget/add_tag.dart';
import 'package:naseha/views/news_feed/widgets/user_information.dart';

class AddNasehaScreen extends StatelessWidget {
  const AddNasehaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black54, actions: [
        Icon(
          Icons.search,
          color: Colors.grey[200],
        ),
      ]),
      backgroundColor: Colors.grey[200],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h(24)),
              const UserInfomation(),
              SizedBox(height: h(16)),
              SizedBox(
                width: w(370),
                height: h(300),
                child: TextField(
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'أضف نصاً...',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  onChanged: (text) {},
                ),
              ),
              const AddTag(),
              SizedBox(height: h(35)),
              InkWell(
                onTap: () async {
                  await context.read<NasehaCubit>().addNaseha(
                      date: 'date',
                      posterEmail: 'posterEmail',
                      text: 'text',
                      upVote: 10,
                      downVote: 10,
                      tags: ['aa', 'aa']);
                },
                child: Container(
                  height: h(45),
                  width: w(141),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54,
                  ),
                  child: Center(
                    child: Text(
                      'نشر',
                      style: TextStyle(fontSize: 22, color: Colors.grey[200]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
