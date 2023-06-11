import 'package:flutter/material.dart';

class RPSCustomPainter4 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 186, 210, 229)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.0025000,size.height*0.1040000);
    path0.lineTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height);
    path0.quadraticBezierTo(size.width*0.8391875,size.height*0.9694200,size.width*0.7517500,size.height*0.6832600);
    path0.cubicTo(size.width*0.5554250,size.height*0.3410200,size.width*0.3562750,size.height*0.2311800,size.width*0.2628000,size.height*0.1737000);
    path0.quadraticBezierTo(size.width*0.1329125,size.height*0.0988600,size.width*0.0025000,size.height*0.1040000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
