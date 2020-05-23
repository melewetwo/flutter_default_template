import 'package:my_awesome_app/pages/landing/landing_model.dart';
import 'package:my_awesome_app/services/gloabl_error_handling/error_message.dart';
import 'package:my_awesome_app/services/gloabl_error_handling/global_error_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LandingModel(),
      child: Consumer<LandingModel>(
          builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('Title'),
            ),
            body: Container(child: Center(
              child: RaisedButton(
                child: Text('showError'),
                onPressed: model.showError
              ),
            ),),
          )
      ),
    );
  }
}