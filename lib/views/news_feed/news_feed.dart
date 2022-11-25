import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: AppBar(actions: const [Icon(Icons.search)]),
      backgroundColor: Colors.grey[350],
      body: ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 5,
          color: Colors.grey[350],
        ),
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.fromLTRB(w(8), h(1), w(8), 0),
              child: Container(
                height: h(360),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: w(20)),
                        Padding(
                          padding: EdgeInsets.only(top: h(3), bottom: h(3)),
                          child: Container(
                            width: w(100),
                            height: h(25),
                            color: Colors.black54,
                            child: Center(
                                child: AutoSizeText(
                              'سفر',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: const NetworkImage(
                              'https://avatars.githubusercontent.com/u/60432384?v=4'),
                        ),
                        SizedBox(width: h(15)),
                        // TODO name
                        Padding(
                          padding: EdgeInsets.only(top: h(8)),
                          child: const Text(
                            'Amr Mahmoud',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: h(3)),
                    Container(
                      width: w(390),
                      height: h(150),
                      child: const Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق.هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: h(55),
                            width: w(340 / 3),
                            child: Column(
                              children: const [
                                Icon(Icons.arrow_circle_up),
                                AutoSizeText('10'),
                              ],
                            )),
                        Container(
                          height: h(55),
                          width: w(340 / 3),
                          child: Column(
                            children: const [
                              Icon(Icons.arrow_circle_down),
                              AutoSizeText('10')
                            ],
                          ),
                        ),
                        Container(
                          height: h(55),
                          width: w(340 / 3),
                          child: Column(
                            children: [
                              Icon(Icons.share),
                              AutoSizeText('مشاركة')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
