import 'package:flutter/material.dart';
import 'package:naseha/views/full_naseha/screen/naseha_screen.dart';
import 'package:naseha/views/news_feed/widgets/custom_tag.dart';
import 'package:naseha/views/news_feed/widgets/text_widget.dart';
import 'package:naseha/views/news_feed/widgets/up_down_share.dart';
import 'package:naseha/views/news_feed/widgets/user_information.dart';

class NasehaWidget extends StatelessWidget {
  const NasehaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.fromLTRB(w(8), h(1), w(8), 0),
        child: Container(
          height: h(360),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomTag(text: 'سفر', tagColor: Colors.black, count: 2),
              const UserInfomation(),
              SizedBox(height: h(3)),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const NasehaScreen())));
                  },
                  child: const TextWidget()),
              const UpDownShare(),
            ],
          ),
        ),
      ),
    );
  }
}
