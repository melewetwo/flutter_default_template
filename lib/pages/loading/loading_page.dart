import 'package:defaulttemplate/pages/loading/loading_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoadingModel(),
      child: Consumer<LoadingModel>(
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(title: Text('Title'),),
            body: Center(
              child: CircularProgressIndicator(), // Todo create splash screen
            ),
          ) ,
      ),
    );


  }
}