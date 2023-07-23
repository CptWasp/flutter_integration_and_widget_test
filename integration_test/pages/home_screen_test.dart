import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/widget_tester.dart';
import 'package:test_task_flutter/keys.dart';

import 'base_screen_test.dart';

class HomeScreeenTest extends BaseScreenTest{
  HomeScreeenTest({required WidgetTester tester}) : super(tester: tester);

  final String _GREEN_BUTTON_KEY = 'ButtonGreen';
  final String _YELLOW_BUTTON_KEY = 'ButtonYellow';


  Future<void> clickToGreen() async {
    await clickToElementByKeyString(_GREEN_BUTTON_KEY);
  }

  Future<void> clickToYellow() async {
    await clickToElementByKeyString(_YELLOW_BUTTON_KEY);
  }

  Future<void> isHomePage(var expectText) async {
    var appBarFinder = findByType(AppBar);

    var textFinder = find.descendant(
      of: appBarFinder,
      matching: findByType(Text),
    );

    var text = (await tester.widget<Text>(textFinder)).data;

    expect(text, expectText);
  }

}