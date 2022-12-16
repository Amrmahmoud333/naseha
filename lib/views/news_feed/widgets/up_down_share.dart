import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';

class UpDownShare extends StatelessWidget {
  const UpDownShare({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    NasehaCubit cubit = context.read<NasehaCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
              height: h(55),
              width: w(340 / 3),
              child: Column(
                children: [
                  const Icon(Icons.arrow_circle_up),
                  AutoSizeText(cubit.listDocument![index].upVote!.toString()),
                ],
              )),
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: h(55),
            width: w(340 / 3),
            child: Column(
              children: [
                const Icon(Icons.arrow_circle_down),
                AutoSizeText(cubit.listDocument![index].downVote!.toString())
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: h(55),
            width: w(340 / 3),
            child: Column(
              children: const [Icon(Icons.share), AutoSizeText('مشاركة')],
            ),
          ),
        ),
      ],
    );
  }
}
