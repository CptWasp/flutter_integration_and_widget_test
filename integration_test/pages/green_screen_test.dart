import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/widget_tester.dart';
import 'package:test_task_flutter/green_screen.dart';

import 'base_screen_test.dart';

class GreenScreenTest extends BaseScreenTest{

  GreenScreenTest({required WidgetTester tester}) : super(tester: tester);


  /*****************************************************************************
   ********************************* Методы ************************************
   ****************************************************************************/

  Future<void> checkBgColor(Color requiredColor) async {
    var requiredWidget = (Widget widget) => widget is Container && widget.color == requiredColor;

    expect(await findByPredicate(requiredWidget), findsOneWidget);
  }

  Future<void> checkElementsExists(Color requiredColor, String text) async{
    var requiredWidget = (Widget widget) => widget is Text && widget.style?.color == requiredColor
    && widget.data == text;

    expect(await findByPredicate(requiredWidget), findsOneWidget);
  }



}