import 'package:auto_route/auto_route.dart';
import 'package:my_awesome_app/services/overlay/cancel_overlay_navigation_observer.dart';
import 'services/overlay/overlay_service.dart';
import 'services/overlay/overlay_wrapper.dart';
import 'services/some_service/some_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'routing/router.gr.dart';
import 'services/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  //setupServiceProvider();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans'),
      builder: (context, child) => OverlayWrapper(
          child: ExtendedNavigator<Router>(
            observers: [CancelOverlayNavigationObserver(GetIt.instance<OverlayService>().dismissAll)],
            key: GetIt.instance<OverlayService>().navigatorKey,
            router: Router(),
          ),
      )
    );
  }
}

void setupServiceProvider() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<OverlayService>(OverlayService());
  getIt.registerSingleton<SomeService>(SomeService());
  // if they have to be async initialized -> can do that in the LoadingPage, navigate to LandingPage when ready
}