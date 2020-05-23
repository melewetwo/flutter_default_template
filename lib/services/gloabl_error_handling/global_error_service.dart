

import 'package:injectable/injectable.dart';
import 'package:my_awesome_app/services/gloabl_error_handling/error_message.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class GlobalErrorService{

  BehaviorSubject<ErrorMessage> _error = BehaviorSubject<ErrorMessage>();
  Stream<ErrorMessage> get error => _error.stream;

  GlobalErrorService(){
    _error.sink.add(null);
  }

  void showErrorDialog(ErrorMessage errorMessage, {Duration duration=const Duration(seconds: 4)}){
    _error.sink.add(errorMessage);
    Future.delayed(duration).then((value) {
      if(_error.stream.value == errorMessage){
        _error.sink.add(null);
      }
    }
    );
  }

  void errorDismissed(){
    _error.sink.add(null);
  }

  void dispose(){
    _error.close();
  }

}