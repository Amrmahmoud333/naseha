import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/naseha_cubit/naseha_cubit.dart';
import 'package:naseha/views/news_feed/widgets/custom_tag.dart';
import 'package:naseha/views/news_feed/widgets/up_down_share.dart';
import 'package:naseha/views/news_feed/widgets/user_information.dart';
import 'package:naseha/views/shared/size.dart';

class NasehaScreen extends StatelessWidget {
  const NasehaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(backgroundColor: Colors.black54, actions: [
        Icon(
          Icons.search,
          color: Colors.grey[200],
        ),
      ]),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(height: size.h(10)),
              CustomTag(
                  tagColor: Colors.yellow,
                  text: context.read<NasehaCubit>().listDocument![0].tags!,
                  count: context
                      .read<NasehaCubit>()
                      .listDocument![0]
                      .tags!
                      .length),
              SizedBox(height: size.h(10)),
              const UserInfomation(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    size.w(8), size.h(8), size.w(8), size.h(8)),
                child: const Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق.هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(height: size.h(15)),
              const UpDownShare(
                index: 0,
              ),
              SizedBox(height: size.h(15)),
            ],
          ),
        ),
      ),
    );
  }
}
