import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/shared/naseha_widget.dart';
import 'package:naseha/views/shared/size.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  ScrollController? _chatScrollController;

  @override
  initState() {
    super.initState();
    context.read<NasehaCubit>().getNaseha();
    _chatScrollController = ScrollController()
      ..addListener(() {
        if (_chatScrollController!.position.atEdge) {
          if (_chatScrollController!.position.pixels == 0) {
            log('ListView scrolled to top');
          } else {
            context.read<NasehaCubit>().getMoreNaseha();
            print(context.read<NasehaCubit>().listDocument!.length.toString());
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    NasehaCubit cubit = context.read<NasehaCubit>();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black54, actions: [
        Icon(
          Icons.search,
          color: Colors.grey[200],
        ),
      ]),
      backgroundColor: Colors.grey[350],
      body: BlocBuilder<NasehaCubit, NasehaState>(
        builder: (context, state) {
          if (state is GetNasehaLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else if (state is GetNasehaEmpty) {
            return const Center(
              child: Text('لا يوجد نصائح'),
            );
          } else if (state is GetNasehaError) {
            return const Center(
              child: Text('حدث خطأ ما'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  top: size.h(5),
                  right: size.w(2.5),
                  left: size.w(2.5),
                  bottom: size.h(11)),
              child: ListView.separated(
                controller: _chatScrollController,
                separatorBuilder: (context, index) => Container(
                  height: size.h(5),
                  color: Colors.grey[350],
                ),
                itemCount: state is HasNotMoreNaseha
                    ? cubit.listDocument!.length
                    : cubit.listDocument!.length + 1,
                itemBuilder: ((context, index) {
                  if (index == cubit.listDocument!.length) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return NasehaWidget(index: index);
                  }
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
