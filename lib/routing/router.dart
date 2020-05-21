

import 'package:auto_route/auto_route_annotations.dart';
import 'package:defaulttemplate/pages/landing/landing_page.dart';

import '../pages/loading/loading_page.dart';

// rerun generation:
// flutter packages pub run build_runner build

// docs: https://pub.dev/packages/auto_route#-readme-tab-

@AdaptiveAutoRouter(
  generateArgsHolderForSingleParameterRoutes: true,
  generateNavigationHelperExtension: true,
  routesClassName: 'Routes'
)
class $Router{

  // auto_route will generate Rotes with params and optional params

  @initial
  LoadingPage loadingScreen;

  LandingPage landingPage;


  //@CustomRoute(fullscreenDialog: true)
  //@GuardedBy([AuthGuard])
  //SecondScreen secondScreen;

  //@unknownRoute
  //UnknownRouteScreen unknownRouteScreen;





}