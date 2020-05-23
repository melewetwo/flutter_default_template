
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:my_awesome_app/services/overlay/data/error_message.dart';
import 'package:my_awesome_app/services/overlay/data/snackbar_content.dart';
import 'package:my_awesome_app/services/overlay/overlay_service.dart';

class LandingModel extends ChangeNotifier {

  LandingModel() {
    init();
  }

  Future<void> init() async {
    notifyListeners();
  }

  void showError() {
    GetIt.instance<OverlayService>().showErrorMessageWOC(ErrorMessage(
      title: 'title',
      message: 'message'
    ));

  }

  void showSnackbar() {
    GetIt.instance<OverlayService>().showSnackbarWOC(snackbarContent:
      SnackbarContent(
        content: 'action text',
        action: SnackbarAction(
          text: "action",
          callback: (){print('action tapped');}
        )
      ),
      duration: Duration(seconds: 20)
    );
  }

}
