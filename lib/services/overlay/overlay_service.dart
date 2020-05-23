


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:my_awesome_app/services/overlay/data/snackbar_content.dart';
import 'package:rxdart/rxdart.dart';

import 'data/error_message.dart';

@singleton
class OverlayService{

  final navigatorKey = GlobalKey<NavigatorState>();
  final NavigatorObserver _navigatorObserver = NavigatorObserver();

  BehaviorSubject<ErrorMessage> _error = BehaviorSubject<ErrorMessage>();
  Stream<ErrorMessage> get error => _error.stream;

  BehaviorSubject<SnackbarContent> _snackbar = BehaviorSubject<SnackbarContent>();
  Stream<SnackbarContent> get snackbar => _snackbar.stream;

  OverlayService(){
    _error.sink.add(null);
    _snackbar.sink.add(null);
  }


  void showDialogWOC({@required Dialog dialog}) {
    final context = navigatorKey.currentState.overlay.context;
    showDialog(context: context, builder: (x) => dialog);
  }

  void showSnackbarWOC({@required SnackbarContent snackbarContent, Duration duration=const Duration(seconds: 4) }) {
    _snackbar.sink.add(snackbarContent);
      Future.delayed(duration).then((value) {
        if(_snackbar.stream.value == snackbarContent){
          _snackbar.sink.add(null);
        }
      }
    );
  }

  void showErrorMessageWOC(ErrorMessage errorMessage, {Duration duration=const Duration(seconds: 4)}){
    _error.sink.add(errorMessage);
    Future.delayed(duration).then((value) {
      if(_error.stream.value == errorMessage){
        _error.sink.add(null);
      }
    }
    );
  }

  void dismissAll(){
    errorDismissed();
    snackbarDismissed();
  }

  void errorDismissed(){
    _error.sink.add(null);
  }

  void snackbarDismissed(){
    _snackbar.sink.add(null);
  }

  void dispose(){
    _error.close();
    _snackbar.close();
  }

}