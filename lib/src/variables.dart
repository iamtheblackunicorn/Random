/*
Random by Alexander Abraham a.k.a. "The Black Unicorn"
licensed under the MIT license.
*/

import 'package:flutter/material.dart';

// App colors.
Color baseBackGroundColor = Color(0xFF000033);
Color diceFaceColor = Color(0xFFFFFFFF);
Color dicePointColor = Color(0xFF00ffff);
Color diceArmedColor = Color(0xFF000000);
Color bgArmedColor = Color(0xFFDF0045);

// Dice dimensions and measurements.
double diceDimensions = 300;
double dicePointRadius = 20;
double diceRoundedBorder = 15.0;

// Timer specs.
int duration = 90;

// String vars.
String stopText = 'Disarm';
String rollText = 'Arm';
String introText = 'Roll the dice.';
String outroText = 'You got a';
String armed = 'Armed!';
String disarmed = 'Disarmed!';

// Offset list indexes.
int min = 0;
int max = 5;

// Button variables.
double outerPadding = 25;
double verticalPadding = 10;
double horizontalPadding = 100;
double buttonRounding = 25;
String defaultFont = 'ProductSansBold';

// Misc variables.
double fontSize = 20;
double topPadding = 50;
