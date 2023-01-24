import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/news_feed/widgets/custom_tag.dart';
import 'package:naseha/views/shared/size.dart';

class TagList extends StatelessWidget {
  const TagList({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return InkWell(
      onTap: () {
        context.read<NasehaCubit>().chooseTags(text);
      },
      child: SizedBox(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(
                      size.w(80), (size.w(80) * 0.3333333333333333).toDouble()),
                  painter: CustomPainterTag(tagColor: Colors.black45),
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
