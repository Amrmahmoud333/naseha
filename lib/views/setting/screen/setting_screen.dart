import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'الإعدادت',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: w(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[350],
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h(8), horizontal: w(8)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    width: w(130),
                    height: h(130),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: w(4),
                          color: Colors.black,
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: w(2),
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: const Offset(0, 10)),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/60432384?v=4'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
