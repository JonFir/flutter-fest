import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/screens/main_tabs/main_tabs_screen.dart';
import 'package:flutter_fest/application/ui/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest/application/ui/screens/session_details_screen.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainTabs() => ChangeNotifierProvider(
        create: (_) => MainTabsViewModel(),
        child: const MainTabsScreen(),
      );

  Widget makeSessionDetails() => const SessionDetailsScreen();
}
