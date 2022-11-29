import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الصفحة الشخصية',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: h(380),
              decoration: const BoxDecoration(color: Colors.grey),
            ),
          ),
          // TODO Logo or profile image
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: h(380),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/60432384?v=4'),
                    fit: BoxFit.cover),
              ),
              foregroundDecoration:
                  BoxDecoration(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              SizedBox(height: h(90)),
              BuildAvatar(),
              SizedBox(height: h(10)),
              // name
              const AutoSizeText(
                'Amr Mahmoud',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h(5)),
              // describtion
              const AutoSizeText(
                'خريج حاسبات ومعلومات',
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BuildAvatar extends StatelessWidget {
  const BuildAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return CircleAvatar(
        backgroundColor: Colors.black54,
        radius: w(80),
        child: CircleAvatar(
            radius: w(80 - 2),
            backgroundImage: const NetworkImage(
                'https://avatars.githubusercontent.com/u/60432384?v=4')));
  }
}
