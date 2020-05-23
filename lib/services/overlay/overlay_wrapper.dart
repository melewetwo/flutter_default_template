import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_awesome_app/services/overlay/data/snackbar_content.dart';

import 'data/error_message.dart';
import 'overlay_service.dart';

class OverlayWrapper extends StatefulWidget {
  OverlayWrapper({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _OverlayWrapperState createState() => _OverlayWrapperState(child);
}

class _OverlayWrapperState extends State<OverlayWrapper> with SingleTickerProviderStateMixin{
  _OverlayWrapperState(child){
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
              StreamBuilder<ErrorMessage>(
                  stream: GetIt.instance<OverlayService>().error,
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
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 600
                          ),
                          child: Dismissible(
                              onDismissed: (direction) {
                                GetIt.instance<OverlayService>().errorDismissed();
                              },
                              key: UniqueKey(),
                              child: Card(
                                elevation: 3.0,
                                child: ListTile(
                                  leading: Icon(Icons.error_outline, color: Colors.red,size: 40,),
                                  title: Text(errorMessage.title),
                                  subtitle: Text(errorMessage.message != null ? errorMessage.message : ''),
                                ),
                              )
                          ),
                        )
                      );
                  }
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: StreamBuilder(
              stream: GetIt.instance<OverlayService>().snackbar,
              builder: (context, snapshot) {
                SnackbarContent content = snapshot.data;

                return AnimatedSwitcher(
                    switchInCurve: Curves.decelerate,
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return SlideTransition(child: child,
                          position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation));
                    },
                    child: content == null ? SizedBox() :
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: 600
                      ),
                      child: Dismissible(
                          onDismissed: (direction) {
                            GetIt.instance<OverlayService>().errorDismissed();
                          },
                          key: UniqueKey(),
                          child: Card(
                            elevation: 3.0,
                            child: ListTile(
                              title: Text('lol'),
                            ),
                          )
                      ),
                    )
                );



              },
            ),
          )
        )
      ],
    );
  }


}