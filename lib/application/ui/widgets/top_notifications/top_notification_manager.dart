import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/widgets/top_notifications/top_notification_overlay_widget.dart';
import 'package:provider/provider.dart';

abstract class TopNotificationManager {
  void show(String text);
}

class TopNotificationManagerWidget extends StatefulWidget {
  final Widget? child;
  const TopNotificationManagerWidget({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  _TopNotificationManagerWidgetState createState() =>
      _TopNotificationManagerWidgetState();
}

class _TopNotificationManagerWidgetState
    extends State<TopNotificationManagerWidget>
    implements TopNotificationManager {
  final _topNotificationOverlayKey =
      GlobalKey<TopNotificationOverlayWidgetState>();
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    final child = widget.child;
    if (child != null) {
      children.add(child);
    }
    final topNotificationOverlayWidget = TopNotificationOverlayWidget(
      key: _topNotificationOverlayKey,
    );
    children.add(topNotificationOverlayWidget);
    return Provider<TopNotificationManager>.value(
      value: this,
      child: Stack(
        children: children,
      ),
    );
  }

  @override
  void show(String text) {
    _topNotificationOverlayKey.currentState?.show(text);
  }
}
