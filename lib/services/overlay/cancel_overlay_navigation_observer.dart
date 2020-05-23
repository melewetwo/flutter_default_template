

import 'package:flutter/cupertino.dart';

class CancelOverlayNavigationObserver extends NavigatorObserver{


  CancelOverlayNavigationObserver(this.callback);

  final Function callback;


  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    callback();
  }

  @override
  void didStopUserGesture() {
    callback();
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    callback();
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    callback();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    callback();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    callback();
  }


}