import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/widget_tester.dart';
import 'package:test_task_flutter/keys.dart';

import 'base_screen_test.dart';

class YellowScreenTest extends BaseScreenTest{
  YellowScreenTest({required WidgetTester tester}) : super(tester: tester);

  Future<void> textInCenterIsNoExists() async {
    String containerKey = Keys.randomNumberContainerKey;
    
    final textFinder = find.descendant(
      of: findByKey(containerKey),
      matching: find.byType(Text),
    );
    
    expect(textFinder, findsNothing);
  }

  Future<void> isButtonExists(String buttonLabel) async {
    WidgetPredicate requiredElement = (Widget widget) =>
    widget is ElevatedButton &&
        widget.child is Text &&
        (widget.child as Text).data == 'Случайное число';

    expect(findByPredicate(requiredElement), findsOneWidget);
  }

  Future<void> clickToButtonRandomNumber() async {
    WidgetPredicate requiredElement = (Widget widget) =>
    widget is ElevatedButton &&
        widget.child is Text &&
        (widget.child as Text).data == 'Случайное число';

    await clickToElementByFinder(findByPredicate(requiredElement));
  }

  Future<void> checkNumberInCenter() async {
    String containerKey = Keys.randomNumberContainerKey;

    var containerFinder = find.byKey(Key(containerKey));
    expect(containerFinder, findsOneWidget);

    var textFinder = find.descendant(
      of: containerFinder,
      matching: findByType(Text),
    );

    var text = (await tester.widget<Text>(textFinder)).data;

    int textToInt = int.parse(text!);

    expect(textToInt >= 0 && textToInt <= 99, true);
  }



}