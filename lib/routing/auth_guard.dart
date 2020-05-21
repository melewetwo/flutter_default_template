

import 'package:auto_route/auto_route.dart';

class AuthGuard extends RouteGuard{

  // docs: https://pub.dev/packages/auto_route#-readme-tab-

  //todo replace with
  var isLoggedIn = true;

  @override
  Future<bool> canNavigate(ExtendedNavigatorState<RouterBase> navigator, String routeName, Object arguments) {
    if (isLoggedIn) {
      return Future<bool>.value(true);
    }
    // move to login
    // ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.loginPage);
    return Future<bool>.value(false);
  }

}