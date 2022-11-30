import 'package:flutter/material.dart';
import 'package:naseha/views/shared/naseha_widget.dart';

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
      appBar: AppBar(backgroundColor: Colors.black54, actions: [
        Icon(
          Icons.search,
          color: Colors.grey[200],
        ),
      ]),
      backgroundColor: Colors.grey[350],
      body: Padding(
        padding: EdgeInsets.only(top: h(5), right: w(2.5), left: w(2.5)),
        child: ListView.separated(
          separatorBuilder: (context, index) => Container(
            height: h(5),
            color: Colors.grey[350],
          ),
          itemCount: 5,
          itemBuilder: ((context, index) {
            return const NasehaWidget();
          }),
        ),
      ),
    );
  }
}
