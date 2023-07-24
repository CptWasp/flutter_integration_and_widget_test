import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pages/components/navigation_component_test.dart';
import 'pages/home_screen_test.dart';
import 'pages/green_screen_test.dart';
import 'pages/yellow_screen_test.dart';
import 'utils/logger.dart';
import 'package:test_task_flutter/colors.dart' as colors;


void main() {

  Logger _logger = Logger();


  testWidgets('E2E test', (WidgetTester tester) async {
    HomeScreeenTest homeScreeenTest = HomeScreeenTest(tester: tester);
    GreenScreenTest greenScreenTest = GreenScreenTest(tester: tester);
    YellowScreenTest yellowScreenTest = YellowScreenTest(tester: tester);
    NavigationComponentTest navigationComponentTest = NavigationComponentTest(tester: tester);

    await homeScreeenTest.initApp();

    await _logger.logInfo('1. тапнуть на “зеленый” - должен открыться экран с белой надписью “зеленый экран” и зеленым фоном');
    await homeScreeenTest.clickToGreen();
    await greenScreenTest.checkBgColor(colors.greenColor);
    await greenScreenTest.checkElementsExists(Colors.white, 'Зеленый экран');


    await _logger.logInfo('2. тапнуть кнопку назад - должны попасть на стартовый экран');
    await navigationComponentTest.clickToBackIconInNavigation();
    await homeScreeenTest.findElementContainsText('Стартовый экран');

    await _logger.logInfo('3. тапнуть на “желтый” - должен открыться экран с кнопкой “случайное число”, текст в центре экрана не отображается');
    await homeScreeenTest.clickToYellow();
    await yellowScreenTest.isButtonExists('Случайное число');
    await yellowScreenTest.textInCenterIsNoExists();


    await _logger.logInfo("4. тапнуть кнопку “случайное число” - отображается надпись с числом от 0 до 99 в центре экрана");
    await yellowScreenTest.clickToButtonRandomNumber();
    await yellowScreenTest.checkNumberInCenter();


    await _logger.logInfo("5. тапнуть кнопку назад - должны попасть на стартовый экран");
    await navigationComponentTest.clickToBackIconInNavigation();
    await homeScreeenTest.wait();
    await homeScreeenTest.isHomePage('Стартовый экран');
    },
  );
}
