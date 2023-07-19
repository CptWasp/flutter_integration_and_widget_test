import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/widget_tester.dart';

import '../base_screen_test.dart';

class NavigationComponentTest extends BaseScreenTest{
  NavigationComponentTest({required WidgetTester tester}) : super(tester: tester);


  Future<void> clickToBackIconInNavigation() async {
    await clickToElementByFinder(find.byIcon(Icons.arrow_back));
  }

}