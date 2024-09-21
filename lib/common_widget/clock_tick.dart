import 'dart:math';
import 'package:flutter/material.dart';
import '../common/Color.dart';

class ClockTick extends CustomPainter {

  final Paint tickPaint = Paint();
  final bool isAnti;

  ClockTick({this.isAnti = false });



  @override
  void paint(Canvas canvas, Size size) {

    const angle = 2 * pi / 24;
    var radius = size.width / 2;
    var activeMax = (24 *  0.75 );

    canvas.save();
    canvas.translate(radius, radius );

    for (var i = 0; i<24 ; i++) {
      if(i > activeMax) {

        tickPaint.color = isAnti ? AppColor.primary : const Color(0xffE6E6E6);


      }else{
        tickPaint.color = isAnti ? const Color(0xffE6E6E6) : AppColor.primary;
      }

      tickPaint.strokeWidth = 3;
      canvas.drawCircle(Offset(0.0, -radius), 3, tickPaint );
      canvas.rotate(angle);
    }

    canvas.restore();
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}