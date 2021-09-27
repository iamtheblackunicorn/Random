/*
Random by Alexander Abraham a.k.a. "The Black Unicorn"
licensed under the MIT license.
*/

import 'dart:ui';
import 'variables.dart';
import 'package:flutter/material.dart';

/// Basic class to draw something
/// resembling a die's face.
class Face extends CustomPainter{
  /// This variable changes during
  /// state updates of the main widget.
  late final List<Offset> offSetList;
  Face({
    required this.offSetList,
  });
  void paint(Canvas canvas, Size size){

    /// Draw the face of the dice.
    Offset center = Offset(
      size.width/2,
      size.height/2
    );
    Paint facePaint = new Paint();
    facePaint.color = diceFaceColor;
    Rect diceFace = Rect.fromCenter(
      center:center,
      width:diceDimensions,
      height:diceDimensions
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        diceFace,
        Radius.circular(
          diceRoundedBorder
        )
      ),
      facePaint
    );

    /// Draw the point(s).
    Paint pointPaint = new Paint();
    pointPaint.color = dicePointColor;
    /// We iterate through the points or [Offsets]
    /// to draw them.
    for (int i = 0; i < offSetList.length; i++){
      canvas.drawCircle(offSetList[i], dicePointRadius, pointPaint);
    }
  }
  /// Tells Dart to keep redrawing the app's
  /// canvas.
  bool shouldRepaint(Face oldDelegate){
    return true;
  }
}
