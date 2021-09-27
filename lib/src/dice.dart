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
          ),

          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [

                new Padding(
                  padding: EdgeInsets.all(30),
                  child:new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    color: Color(0xFFFFFFFF),
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 100,
                      right: 100
                    ),
                    child: new Text(
                      'ROLL',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 30,
                        fontFamily: 'ProductSansBold'
                      )
                    ),
                    onPressed: () {
                    }
                  )
                )


              ]
            )
          )
        ]
      )
    );
  }
}
