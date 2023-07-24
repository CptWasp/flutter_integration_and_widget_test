import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task_flutter/keys.dart';
import 'package:test_task_flutter/random_number_generator.dart';
import 'package:test_task_flutter/yellow_screen.dart';
import 'package:test_task_flutter/colors.dart' as colors;

import '../../integration_test/utils/logger.dart';
import '../widget_test.dart';

class WidgetTestScenarios{
  late WidgetTester tester;
  WidgetTestScenarios({required this.tester});

  Logger _logger = Logger();


  Future<void> successScenario(int testData)async {
    await _logger.logInfo('создать инстанс виджета желтого экрана');
    var generator = RandomNumberMocks();
    generator.setTestNumber(testData);
    final yellowScreen = YellowScreen(generator: generator);
    await tester.pumpWidget(MaterialApp(home: yellowScreen));

    _logger.logInfo('1. должна отображаться кнопка “случайное число”, фон экрана желтый, а также должна отображаться кнопка “назад”');
    expect(find.text('Случайное число'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(tester.widget<AppBar>(find.byType(AppBar)).backgroundColor, colors.yellowColor);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);


    _logger.logInfo('2. тапнуть по кнопке “случайное число” и проверить, что число от 0 до 49 отображается синим цветом');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    final container = find.byKey(const Key(Keys.randomNumberContainerKey));
    final textWidget = tester.widget<Text>(find.descendant(of: container, matching: find.byType(Text)));

    expect(textWidget.style!.color, colors.blueColor);
    expect(int.parse(textWidget.data!), inInclusiveRange(0, 49));
  }

  Future<void> unsuccessScenario(int testData) async {
    await _logger.logInfo('создать инстанс виджета желтого экрана');
    var generator = RandomNumberMocks();
    generator.setTestNumber(testData);
    final yellowScreen = YellowScreen(generator: generator);
    await tester.pumpWidget(MaterialApp(home: yellowScreen));

    _logger.logInfo('1. должна отображаться кнопка “случайное число”, фон экрана желтый, а также должна отображаться кнопка “назад”');
    expect(find.text('Случайное число'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(tester.widget<AppBar>(find.byType(AppBar)).backgroundColor, colors.yellowColor);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);


    _logger.logInfo('2. тапнуть по кнопке “случайное число” и проверить, что число от 0 до 49 отображается синим цветом');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    final container = find.byKey(const Key(Keys.randomNumberContainerKey));
    final textWidget = tester.widget<Text>(find.descendant(of: container, matching: find.byType(Text)));

    expect(textWidget.style!.color != colors.blueColor, true);

  }


}