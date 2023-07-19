import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/green_screen.dart';

import 'pages/home_screen_test.dart';
import 'pages/green_screen_test.dart';
import 'pages/yellow_screen_test.dart';
import 'utils/logger.dart';

void main() {

  Logger _logger = Logger();


  testWidgets('E2E test', (WidgetTester tester) async {
    HomeScreeenTest homeScreeenTest = HomeScreeenTest(tester: tester);
    GreenScreenTest greenScreenTest = GreenScreenTest(tester: tester);
    YellowScreenTest yellowScreenTest = YellowScreenTest(tester: tester);

    await homeScreeenTest.initApp();

    await _logger.logInfo('1. тапнуть на “зеленый” - должен открыться экран с белой надписью “зеленый экран” и зеленым фоном');



    },
  );
}
