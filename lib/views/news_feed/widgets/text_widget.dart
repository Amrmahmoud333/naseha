import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/shared/size.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Padding(
      padding: EdgeInsets.only(
          right: size.w(8), left: size.w(8), bottom: size.h(10)),
      child: SizedBox(
        width: size.w(390),
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
