import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/screen_factory/screen_factory.dart';

abstract class Screens {
  static const main = "/";
}

class MainNavigation {
  final _screenFactory = ScreenFactory();
  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.main: (_) => _screenFactory.makeMainTabs(),
      };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
