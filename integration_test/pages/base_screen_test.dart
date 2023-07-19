import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_flutter/main.dart' as app;

import '../utils/logger.dart';



abstract class BaseScreen{

  late WidgetTester tester;

  BaseScreen({required this.tester});

  Logger _logger = Logger();


  Future<void> initApp() async {
    await _logger.logInfo('Запуск приложения');
    runApp(const app.MyApp());
    await tester.pumpAndSettle();
    await tester.ensureVisible(findByType(ElevatedButton));
  }


  // todo byKey, byWidgetPredicate, byType и тд

  Finder findByKey(String keyValue) {
    return find.byKey(ValueKey(keyValue));
  }

  Finder findByPredicate() {
    return find.byWidgetPredicate((widget) => false);
  }

  Finder findByType(Type elementType){
    return find.byType(elementType);
  }

  Future<void> wait() async {
    await tester.pumpAndSettle();
  }

  Future<void> clickToElement(String keyString) async{
    await tester.tap(findByKey(keyString));
    await wait();
  }



  
  // Color getAppbarColor(){
  //
  // }


}