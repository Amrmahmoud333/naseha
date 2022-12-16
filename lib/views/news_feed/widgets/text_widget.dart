import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
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

    return Padding(
      padding: EdgeInsets.only(right: w(8), left: w(8), bottom: h(10)),
      child: SizedBox(
        width: w(390),
        child: Text(
          context.read<NasehaCubit>().listDocument![index].text!,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
