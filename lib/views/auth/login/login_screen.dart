import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: ListView(
          children: [
            SizedBox(height: h(30)),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://icons-for-free.com/download-icon-avatar+person+profile+user+icon-1320166578424287581_512.png'),
              maxRadius: 50,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: h(20)),
            Container(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: h(400),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: h(90)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: w(20)),
                            child: TextField(
                              style: const TextStyle(color: Colors.blue),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                helperStyle: TextStyle(
                                  color: Colors.blue.shade200,
                                ),
                                border: InputBorder.none,
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: w(20), right: w(20), bottom: h(10)),
                            child: Divider(
                              color: Colors.blue.shade400,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: w(20)),
                            child: TextField(
                              style: const TextStyle(color: Colors.blue),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                helperStyle: TextStyle(
                                  color: Colors.blue.shade200,
                                ),
                                border: InputBorder.none,
                                icon: const Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: w(20), right: w(20), bottom: h(10)),
                            child: Divider(
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blue.shade600,
                        child: const Icon(
                          Icons.person,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h(420),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('login'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(child: Text('Sign up')),
          ],
        ),
      ),
    );
  }
}

class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..quadraticBezierTo(size.width, 0.0, size.width - 20.0, 0.0)
      ..lineTo(40.0, 70.0)
      ..quadraticBezierTo(10.0, 85.0, 0.0, 120.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
