import 'package:auto_route/auto_route.dart';
import 'services/gloabl_error_handling/error_wrapper.dart';
import 'services/some_service/some_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'routing/router.gr.dart';
import 'services/gloabl_error_handling/global_error_service.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      builder: (context, child) => ErrorWrapper(
          child: ExtendedNavigator<Router>(
            router: Router(),
          ),
      )
    );
  }
}

void setupServiceProvider() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<GlobalErrorService>(GlobalErrorService());
  getIt.registerSingleton<SomeService>(SomeService());
  // if they have to be async initialized -> can do that in the LoadingPage, navigate to LandingPage when ready
}