import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:naseha/views/porfile/widget/custom_app_bar.dart';
import 'package:naseha/views/porfile/widget/profile_avatar.dart';
import 'package:naseha/views/porfile/widget/profile_information.dart';
import 'package:naseha/views/shared/naseha_widget.dart';
import 'package:naseha/views/shared/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizer size = Sizer(context: context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.grey[350],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.h(440),
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: size.h(440),
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                    ),
                    // TODO Logo or profile image
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: size.h(450),
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
                        SizedBox(height: size.h(90)),
                        const ProfileAvatar(),
                        SizedBox(height: size.h(10)),
                        // name
                        const AutoSizeText(
                          'Amr Mahmoud',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: size.h(5)),
                        // describtion
                        const AutoSizeText(
                          'خريج حاسبات ومعلومات',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: size.h(10)),
                        const ProfileInformation(),
                      ],
                    ),
                    const CustomAppBar(),
                  ],
                ),
              ),
              for (int i = 0; i < 5; i++)
                Column(
                  children: [
                    SizedBox(height: size.h(5)),
                    const NasehaWidget(
                      index: 1,
                    ),
                  ],
                ),
              SizedBox(height: size.h(20)),
            ],
          ),
        ),
      ),
    );
  }
}
