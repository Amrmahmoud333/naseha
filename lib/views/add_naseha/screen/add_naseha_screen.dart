import 'package:flutter/material.dart';
import 'package:naseha/views/news_feed/widgets/user_information.dart';

class AddNasehaScreen extends StatelessWidget {
  const AddNasehaScreen({Key? key}) : super(key: key);

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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h(24)),
              const UserInfomation(),
              SizedBox(height: h(16)),
              SizedBox(
                width: w(370),
                height: h(300),
                child: TextField(
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xFF6E75A0),
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'أضف نصاً...',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF6E75A0),
                    ),
                  ),
                  onChanged: (text) {},
                ),
              ),
              const AddTag(),
              SizedBox(height: h(35)),
              Container(
                height: h(45),
                width: w(141),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 182, 218, 244),
                ),
                child: const Center(
                  child: Text(
                    'نشر',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff5B618A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTag extends StatelessWidget {
  const AddTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      width: w(355),
      height: h(66),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xff5B618A),
            blurStyle: BlurStyle.inner,
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(-2, -3),
          )
        ],
        color: const Color.fromARGB(255, 182, 218, 244),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff5B618A), width: 1),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(width: w(10)),
            const Center(
              child: Text(
                'أضف هاشتاج',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff5B618A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
