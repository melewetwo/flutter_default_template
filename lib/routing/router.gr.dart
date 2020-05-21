// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:defaulttemplate/pages/loading/loading_page.dart';
import 'package:defaulttemplate/pages/landing/landing_page.dart';

abstract class Routes {
  static const loadingScreen = '/';
  static const landingPage = '/landing-page';
  static const all = {
    loadingScreen,
    landingPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.loadingScreen:
        if (hasInvalidArgs<LoadingPageArguments>(args)) {
          return misTypedArgsRoute<LoadingPageArguments>(args);
        }
        final typedArgs =
            args as LoadingPageArguments ?? LoadingPageArguments();
        return buildAdaptivePageRoute<dynamic>(
          builder: (context) => LoadingPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.landingPage:
        if (hasInvalidArgs<LandingPageArguments>(args)) {
          return misTypedArgsRoute<LandingPageArguments>(args);
        }
        final typedArgs =
            args as LandingPageArguments ?? LandingPageArguments();
        return buildAdaptivePageRoute<dynamic>(
          builder: (context) => LandingPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LoadingPage arguments holder class
class LoadingPageArguments {
  final Key key;
  LoadingPageArguments({this.key});
}

//LandingPage arguments holder class
class LandingPageArguments {
  final Key key;
  LandingPageArguments({this.key});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushLoadingScreen({
    Key key,
  }) =>
      pushNamed(
        Routes.loadingScreen,
        arguments: LoadingPageArguments(key: key),
      );

  Future pushLandingPage({
    Key key,
  }) =>
      pushNamed(
        Routes.landingPage,
        arguments: LandingPageArguments(key: key),
      );
}
