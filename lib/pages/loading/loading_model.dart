import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:my_awesome_app/routing/router.gr.dart';
import 'package:my_awesome_app/services/some_service/some_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class LoadingModel extends ChangeNotifier {

  final SomeService _someService = GetIt.instance<SomeService>();

  List<StreamSubscription> _subscriptions;

  LoadingModel() {
    _subscriptions = [];
    init();
  }

  Future<void> init() async {
    // example:
    _subscriptions.add(_someService.initialized.listen((event) {
      if(event == true){
        ExtendedNavigator.ofRouter<Router>().pushReplacementNamed(Routes.landingPage);
      }
    }));
  }

  @override
  void dispose() {
    _subscriptions.forEach((element) {element?.cancel();});
    super.dispose();
  }
}
