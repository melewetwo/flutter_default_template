
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class SomeService{  // just a sample

  BehaviorSubject<bool> _initialized = BehaviorSubject<bool>();
  Stream<bool> get initialized => _initialized.stream;

  SomeService(){
    _initialized.sink.add(false);
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    //todo: initialize
    _initialized.sink.add(true);
  }

  void dispose(){
    _initialized?.close();
  }







}