import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/add_naseha/widget/add_tag.dart';
import 'package:naseha/views/add_naseha/widget/tag_list.dart';
import 'package:naseha/views/home_page/home_page.dart';
import 'package:naseha/views/news_feed/widgets/user_information.dart';
import 'package:naseha/views/shared/size.dart';

class AddNasehaScreen extends StatelessWidget {
  const AddNasehaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NasehaCubit cubit = context.read<NasehaCubit>();
    final Sizer size = Sizer(context: context);

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
              SizedBox(height: size.h(15)),
              Padding(
                padding: EdgeInsets.only(left: size.w(10)),
                child: BlocBuilder<NasehaCubit, NasehaState>(
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
              ),
              const UserInfomation(),
              SizedBox(height: size.h(16)),
              SizedBox(
                width: size.w(370),
                height: size.h(300),
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
                  onChanged: (text) {
                    cubit.setText(text);
                  },
                ),
              ),
              const AddTag(),
              SizedBox(height: size.h(35)),
              InkWell(
                onTap: () async {
                  cubit.text.isEmpty
                      ? {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('برجاء إضافة نص'))),
                          cubit.valid = false
                        }
                      : {
                          cubit.valid = true,
                          await cubit.addNaseha(
                            date: DateTime.now().toString(),
                            posterEmail:
                                FirebaseAuth.instance.currentUser!.email,
                            text: cubit.text,
                            upVote: 0,
                            downVote: 0,
                            tags: cubit.tags,
                          ),
                          cubit.tags = [],
                          cubit.text = '',
                        };
                  // navaigate with bottom nav bar
                  if (cubit.valid)
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                      builder: ((context) => HomePage()),
                    ));
                },
                child: BlocBuilder<NasehaCubit, NasehaState>(
                  builder: (context, state) {
                    return Container(
                      height: size.h(45),
                      width: size.w(141),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: state is AddNasehaLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: size.w(3)),
                              child: Center(
                                child: Text(
                                  'نشر',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.grey[200]),
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
