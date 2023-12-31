import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task_flutter/random_number_generator.dart';


import 'scenario/widget_test_scenario.dart';

class RandomNumberMocks extends Mock implements RandomNumberGenerator{

  late int _testingInt;
  @override
  int generate() => _testingInt;

  void setTestNumber(int testingInt){
    this._testingInt = testingInt;
  }
}

void main() {

  group('проверка граничных значении', () {
        testWidgets(
            'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - 0',
                (WidgetTester tester) async {
                      int testData = 0;
                      WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
                      await testScenarios.successScenario(testData);
        });

        testWidgets(
            'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - 1',
                (WidgetTester tester) async {
              int testData = 1;
              WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
              await testScenarios.successScenario(testData);
        });

        testWidgets(
            'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - 48',
                (WidgetTester tester) async {
              int testData = 48;
              WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
              await testScenarios.successScenario(testData);
        });

        testWidgets(
            'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - 49',
                (WidgetTester tester) async {
              int testData = 48;
              WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
              await testScenarios.successScenario(testData);
        });

        testWidgets(
            'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - -1',
                (WidgetTester tester) async {
              int testData = -1;
              WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
              await testScenarios.unsuccessScenario(testData);
        });

        testWidgets(
            'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - 50',
                (WidgetTester tester) async {
              int testData = 50;
              WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
              await testScenarios.unsuccessScenario(testData);
        });
  });

  group('Эквивалетные значения', () {
    testWidgets(
        'Проверяем, что при тапе по кнопке число от 0 до 49 отображается синим цветом - 24',
            (WidgetTester tester) async {
          int testData = 24;
          WidgetTestScenarios testScenarios = WidgetTestScenarios(tester: tester);
          await testScenarios.successScenario(testData);
        });
  });
}
