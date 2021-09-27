/*
Random by Alexander Abraham a.k.a. "The Black Unicorn"
licensed under the MIT license.
*/

import 'dart:ui';
import 'dart:math';
import 'face.dart';
import 'dart:async';
import 'variables.dart';
import 'package:flutter/material.dart';

/// Main widget of the app.
/// We make this [stateful] so that
/// we can update layout components.
/// In this case, the die's face.
class TheDice extends StatefulWidget{
  @override
  TheDiceState createState() => TheDiceState();
}
class TheDiceState extends State<TheDice> {
  /// Empty placeholders for all the
  /// variables and points that will
  /// be used during the lifetime of
  /// the widget.
  late List<Offset> offSetListOne;
  late List<Offset> offSetListTwo;
  late List<Offset> offSetListThree;
  late List<Offset> offSetListFour;
  late List<Offset> offSetListFive;
  late List<Offset> offSetListSix;
  late List<List<Offset>> allFaces;
  late List<Offset> currentFace;
  late Random randInst;
  late Random otherRandInst;
  late Function buttonAction;
  late String buttonText;
  late Timer timer;

  /// Here we actually populate
  /// the empty variables.
  /// We use [window.physicalSize.width/window.devicePixelRatio]
  /// to replicate [MediaQuery.of(context).size.width].
  /// We cannot use this because the context is still not clear.
  @override
  void initState(){
    super.initState();
    randInst = new Random();
    otherRandInst = new Random();
    buttonAction = rollDice;
    buttonText = rollText;
    offSetListOne = [
      Offset(
        (window.physicalSize.width/window.devicePixelRatio)/2,
        (window.physicalSize.height/window.devicePixelRatio)/2
      )
    ];
    offSetListTwo = [
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      )
    ];
    offSetListThree = [
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2),
        ((window.physicalSize.height/window.devicePixelRatio)/2)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      )
    ];
    offSetListFour = [
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      )
    ];
    offSetListFive = [
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2),
        ((window.physicalSize.height/window.devicePixelRatio)/2)
      )
    ];
    offSetListSix = [
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)+(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        ((window.physicalSize.height/window.devicePixelRatio)/2)-(diceDimensions/3)
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)-(diceDimensions/3),
        (window.physicalSize.height/window.devicePixelRatio)/2
      ),
      Offset(
        ((window.physicalSize.width/window.devicePixelRatio)/2)+(diceDimensions/3),
        (window.physicalSize.height/window.devicePixelRatio)/2
      )
    ];
    allFaces = [
      offSetListOne,
      offSetListTwo,
      offSetListThree,
      offSetListFour,
      offSetListFive,
      offSetListSix
    ];
    currentFace = offSetListOne;
  }

  /// Here we tell the dice
  /// to stop rolling.
  @override
  void stopRolling(){
    timer.cancel();
    setState((){
      otherRandInst = new Random();
      int randIndex = min + otherRandInst.nextInt(max - min);
      currentFace = allFaces[randIndex];
      buttonAction = rollDice;
      buttonText = rollText;
    });
  }

  /// Here we tell the dice
  /// to roll.
  @override
  void rollDice(){
    setState((){
      buttonAction = stopRolling;
      buttonText = stopText;
      timer = Timer.periodic(
        Duration(
          milliseconds: duration
        ), (timer) {
        setState(() {
          randInst = new Random();
          currentFace = allFaces[
            randInst.nextInt(allFaces.length)
          ];
        });
      });
    });
  }

  /// This is the main widget tree.
  /// We have a [Stack] as the main
  /// component to place widgets atop
  /// each other.
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Stack(
        children: <Widget> [

          /// The main royal blue container
          /// covering the whole screen
          /// and containing the die's face.
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: baseBackGroundColor,
            child: new CustomPaint(
              painter: Face(
                offSetList: currentFace
              )
            )
          ),

          /// The roll button widget.
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [

                new Padding(
                  padding: EdgeInsets.all(outerPadding),
                  child:new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonRounding)
                    ),
                    color: diceFaceColor,
                    padding: EdgeInsets.only(
                      top: verticalPadding,
                      bottom: verticalPadding,
                      left: horizontalPadding,
                      right: horizontalPadding
                    ),
                    child: new Text(
                      buttonText,
                      style: TextStyle(
                        color: baseBackGroundColor,
                        fontSize: outerPadding,
                        fontFamily: defaultFont
                      )
                    ),
                    onPressed: () {
                      buttonAction();
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
