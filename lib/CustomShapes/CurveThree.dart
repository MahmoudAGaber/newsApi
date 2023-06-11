import 'package:flutter/material.dart';

class RPSCustomPainter3 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0 .color = Color.fromRGBO(66, 161, 237, .8);


    Path path0 = Path();
    path0.moveTo(size.width*0.0012500,size.height*0.2020000);
    path0.lineTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height*0.7963200);
    path0.quadraticBezierTo(size.width*0.7985750,size.height*0.8229800,size.width*0.6994500,size.height*0.5827200);
    path0.cubicTo(size.width*0.6303375,size.height*0.3937400,size.width*0.5174250,size.height*0.2371800,size.width*0.3487500,size.height*0.2026400);
    path0.quadraticBezierTo(size.width*0.1505000,size.height*0.1794400,size.width*0.0012500,size.height*0.2020000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
