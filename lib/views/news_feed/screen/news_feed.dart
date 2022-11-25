import 'package:flutter/material.dart';
import 'package:naseha/views/news_feed/widgets/text_widget.dart';
import 'package:naseha/views/news_feed/widgets/up_down_share.dart';
import 'package:naseha/views/news_feed/widgets/user_information.dart';

import '../widgets/tags.dart';

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
                    const Tags(),
                    const UserInfomation(),
                    SizedBox(height: h(3)),
                    const TextWidget(),
                    const UpDownShare(),
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
