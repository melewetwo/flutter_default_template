

import 'package:flutter/cupertino.dart';

class SnackbarContent{

  SnackbarContent({@required this.content, this.action});

  final String content;

  final SnackbarAction action;

}

class SnackbarAction{

  SnackbarAction({@required this.callback, @required this.text});

  final Function callback;

  final String text;

}