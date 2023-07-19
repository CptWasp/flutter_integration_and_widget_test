import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/main.dart' as app;

import '../utils/logger.dart';



abstract class BaseScreenTest{

  late WidgetTester tester;

  BaseScreenTest({required this.tester});

  Logger _logger = Logger();


  Future<void> initApp() async {
    await _logger.logInfo('Запуск приложения');
    runApp(const app.MyApp());
    await tester.pumpAndSettle();
  }


  // todo byKey, byWidgetPredicate, byType и тд

  Finder findByKey(String keyValue) {
    return find.byKey(ValueKey(keyValue));
  }

  Finder findByPredicate(WidgetPredicate requiredWidget) {
    return find.byWidgetPredicate(requiredWidget);
  }

  Finder findByType(Type elementType){
    return find.byType(elementType);
  }

  Future<void> wait() async {
    await tester.pumpAndSettle();
  }

  Future<void> clickToElementByKeyString(String keyString) async{
    await tester.tap(findByKey(keyString));
    await wait();
  }

  Future<void> clickToElementByFinder(Finder finder) async{
    await tester.tap(finder);
    await wait();
  }

  Future<Finder> findElementContainsText(String text) async {
    return await find.text(text);
  }

  Future<void> goBack() async {

  }

}