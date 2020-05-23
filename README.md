# default_template_flutter

a starting point for flutter applications.

## getting started:

enable or update flutter_create:
```
flutter pub global activate --source git https://github.com/melewetwo/flutter_create.git
```

to create a new project from this repo run:
```
flutter pub global run flutter_create -u https://github.com/melewetwo/flutter_default_template.git -a my_awesome_app 
```
replace my_awesome_app with your app name. <br/> <br/>

afterwards run inside project folder:

```
flutter create .
flutter pub get
flutter packages pub run build_runner build
````

## using the template:

### Routing

Add routes to
```
lib/routing/router.dart
```
and run
```
flutter packages pub run build_runner build
```
afterwards.
You can navigate without context using
```
ExtendedNavigator.ofRouter<Router>().pushReplacementNamed(Routes.route);
```

### Overlays: Dialog, Snackbar and ErrorMessages

Display ErrorMessages without context:
```
GetIt.instance<OverlayService>().showErrorMessageWOC(ErrorMessage(
      title: 'title',
      message: 'message'
    ));
```

Display Snackbar without context or Scaffold:
```
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
```

