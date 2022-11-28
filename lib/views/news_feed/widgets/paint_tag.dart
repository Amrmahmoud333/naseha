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

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomPaint(
          size: Size(
              w(80),
              (w(80) * 0.3333333333333333)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
        ),
        Padding(
          padding: EdgeInsets.only(left: w(25)),
          child: CustomPaint(
            size: Size(
                w(80),
                (w(80) * 0.3333333333333333)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black54
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
    return true;
  }
}
