import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'error_message.dart';
import 'global_error_service.dart';

class ErrorWrapper extends StatefulWidget {
  ErrorWrapper({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _ErrorWrapperState createState() => _ErrorWrapperState(child);
}

class _ErrorWrapperState extends State<ErrorWrapper> with SingleTickerProviderStateMixin{
  _ErrorWrapperState(child){
    this._child = child;
  }

  Widget _child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _child,
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              StreamBuilder<Object>(
                  stream: GetIt.instance<GlobalErrorService>().error,
                  builder: (context, snapshot) {
                    ErrorMessage errorMessage = snapshot.data;
                    return AnimatedSwitcher(
                      switchInCurve: Curves.decelerate,
                      duration: Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return SlideTransition(child: child,
                            position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0)).animate(animation));
                      },
                      child: errorMessage == null ? SizedBox() :
                        Dismissible(
                            onDismissed: (direction) {
                              GetIt.instance<GlobalErrorService>().errorDismissed();
                            },
                            key: UniqueKey(),
                            child: Card(
                              elevation: 3.0,
                              child: ListTile(
                                leading: Icon(Icons.error_outline, color: Colors.red,size: 40,),
                                title: Text(errorMessage.title),
                                subtitle: Text(errorMessage.message),
                              ),
                            )
                        )
                      );
                  }
              ),
            ),
          ),
        )
      ],
    );
  }


}