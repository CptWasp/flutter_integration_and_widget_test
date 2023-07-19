import 'package:flutter_test/src/widget_tester.dart';

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

}