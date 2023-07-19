class Logger {

  Logger(){}

  Future<void> logInfo(String text)async{
    print('[INFO]: $text');
  }

  Future<void> logError(String text) async{
    print('[ERROR]: $text');
  }

}