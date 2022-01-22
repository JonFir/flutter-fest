import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/navigation/main_navigation.dart';
import 'package:flutter_fest/application/ui/themes/app_theme.dart';
import 'package:flutter_fest/application/ui/widgets/top_notifications/top_notification_manager.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      builder: (_, child) => TopNotificationManagerWidget(child: child),
    );
  }
}
