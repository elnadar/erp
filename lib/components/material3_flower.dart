import 'package:flutter/material.dart';

class MatFlower extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8283266, size.height * 0.8283266);
    path_0.cubicTo(
        size.width * 0.9840785,
        size.height * 0.7867774,
        size.width * 1.045078,
        size.height * 0.6505018,
        size.width * 0.9643285,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 1.045078,
        size.height * 0.3494745,
        size.width * 0.9840785,
        size.height * 0.2131989,
        size.width * 0.8283266,
        size.height * 0.1716728);
    path_0.cubicTo(
        size.width * 0.7867774,
        size.height * 0.01592164,
        size.width * 0.6505018,
        size.height * -0.04507883,
        size.width * 0.5000000,
        size.height * 0.03567172);
    path_0.cubicTo(
        size.width * 0.3494745,
        size.height * -0.04507883,
        size.width * 0.2131971,
        size.height * 0.01592164,
        size.width * 0.1716726,
        size.height * 0.1716728);
    path_0.cubicTo(
        size.width * 0.01592164,
        size.height * 0.2131989,
        size.width * -0.04507883,
        size.height * 0.3494745,
        size.width * 0.03567172,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * -0.04507883,
        size.height * 0.6505255,
        size.width * 0.01592164,
        size.height * 0.7867774,
        size.width * 0.1716726,
        size.height * 0.8283266);
    path_0.cubicTo(
        size.width * 0.2131971,
        size.height * 0.9840785,
        size.width * 0.3494745,
        size.height * 1.045078,
        size.width * 0.5000000,
        size.height * 0.9643285);
    path_0.cubicTo(
        size.width * 0.6505255,
        size.height * 1.045078,
        size.width * 0.7867774,
        size.height * 0.9840785,
        size.width * 0.8283266,
        size.height * 0.8283266);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
