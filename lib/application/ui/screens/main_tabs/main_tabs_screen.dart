import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest/application/ui/screens/main_tabs/schedule_widget.dart';
import 'package:flutter_fest/resources/resources.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _NavBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select(
      (MainTabsViewModel vm) => vm.currentTabIndex,
    );
    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleWidget(),
        Center(
          child: Text(
            "2",
            style: TextStyle(color: Colors.red),
          ),
        ),
        Center(
          child: Text(
            "3",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class _NavBarWidget extends StatelessWidget {
  const _NavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    final currentIndex = context.select(
      (MainTabsViewModel vm) => vm.currentTabIndex,
    );
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final buttons = [
      _BottomNavigationBarItemFactory(AppImages.tabbarCalendar, "Расписание"),
      _BottomNavigationBarItemFactory(AppImages.tabbarBookmark, "Избранное"),
      _BottomNavigationBarItemFactory(AppImages.tabbarPoint, "Как добраться"),
    ]
        .asMap()
        .map((index, value) {
          return MapEntry(index, value.build(index, currentIndex, theme));
        })
        .values
        .toList();
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
    );
  }
}

class _BottomNavigationBarItemFactory {
  final String iconName;
  final String tooltip;

  _BottomNavigationBarItemFactory(this.iconName, this.tooltip);

  BottomNavigationBarItem build(
    int index,
    int currentIndex,
    BottomNavigationBarThemeData theme,
  ) {
    final color = index == currentIndex
        ? theme.selectedItemColor
        : theme.unselectedItemColor;
    return BottomNavigationBarItem(
      label: "",
      icon: Image.asset(
        iconName,
        color: color,
      ),
      tooltip: tooltip,
    );
  }
}
