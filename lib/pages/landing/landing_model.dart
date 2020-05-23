import 'package:my_awesome_app/services/gloabl_error_handling/error_message.dart';
import 'package:my_awesome_app/services/gloabl_error_handling/global_error_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class LandingModel extends ChangeNotifier {

  LandingModel() {
    init();
  }

  Future<void> init() async {
    notifyListeners();
  }

  void showError() {
    GetIt.instance<GlobalErrorService>().showErrorDialog(ErrorMessage(
      title: 'title',
      message: 'message'
    ));

  }
}
