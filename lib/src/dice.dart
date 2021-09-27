import 'face.dart';
import 'variables.dart';
import 'package:flutter/material.dart';

class TheDice extends StatefulWidget{
  @override
  TheDiceState createState() => TheDiceState();
}
class TheDiceState extends State<TheDice> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Stack(
        children: <Widget> [
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: baseBackGroundColor,
            child: new CustomPaint(
              painter: Face(
                offSetList: [Offset(MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.height/2)]
              )
            )
          )
        ]
      )
    );
  }
}
