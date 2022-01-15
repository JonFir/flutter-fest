import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';

class TopNotificationOverlayWidget extends StatelessWidget {
  final Widget child;

  const TopNotificationOverlayWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  static OverlayEntry makeOverlayEntry(Widget child) {
    return OverlayEntry(
      builder: (_) => TopNotificationOverlayWidget(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        child: Container(
          padding: EdgeInsets.only(top: topPadding),
          color: AppColors.green,
          child: child,
        ),
      ),
    );
  }
}
