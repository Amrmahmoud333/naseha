import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return SizedBox(
      width: w(390),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(left: w(25)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(w(80), (w(80) * 0.3333333333333333).toDouble()),
                  painter: FirstTag(),
                ),
                const Text(
                  'سفر',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: w(95)),
            child: CustomPaint(
              size: Size(w(80), (w(80) * 0.3333333333333333).toDouble()),
              painter: RPSCustomPainter(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: w(165)),
            child: CustomPaint(
              size: Size(w(80), (w(80) * 0.3333333333333333).toDouble()),
              painter: RPSCustomPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.1666667, size.height * 0.5000000);
    path0.lineTo(size.width * 0.0014333, size.height);
    path0.lineTo(size.width * 0.8351500, size.height);
    path0.lineTo(size.width, size.height * 0.4950500);
    path0.lineTo(size.width * 0.8274833, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class FirstTag extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.8183455, size.height);
    path0.lineTo(size.width * 1.0032182, size.height * 0.5004500);
    path0.lineTo(size.width * 0.8198727, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
