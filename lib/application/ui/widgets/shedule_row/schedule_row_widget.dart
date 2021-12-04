import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/schedule_row_session_widget.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/schedule_row_time_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({Key? key}) : super(key: key);

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleRowMultiSessionWidget(key: key);
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl: 'https://klike.net/uploads/posts/2019-06/1560329641_2.jpg',
      speakerName: 'Алексей Чулпин',
      sessionTitle: 'Субьективность в оценке дизайна',
      isFavorite: true,
      progressStatus: ScheduleRowWidgetConfigurationProgressStatus.oncoming,
    );
    return IntrinsicHeight(
      child: CustomMultiChildLayout(
        delegate: RowLayoutDelegate(),
        children: [
          LayoutId(
            id: 1,
            child: const ScheduleRowTimeWidget(),
          ),
          LayoutId(
            id: 2,
            child: ScheduleRowSessionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
    );
  }
}

class RowLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    final size = super.getSize(constraints);
    return size;
  }

  @override
  void performLayout(Size size) {
    const firstChildWidth = 48.0;
    const spaceChildWidth = 12.0;
    const secondChildXOffset = firstChildWidth + spaceChildWidth;
    print(2);
    var secondChildSize = Size.zero;
    if (hasChild(2)) {
      final maxWidth = size.width - secondChildXOffset;
      secondChildSize = layoutChild(
        2,
        BoxConstraints(maxWidth: maxWidth),
      );
    }
    if (hasChild(1)) {
      final maxHeight = max(secondChildSize.height, 90.0);
      layoutChild(
        1,
        BoxConstraints(
          maxWidth: firstChildWidth,
          maxHeight: maxHeight,
        ),
      );
    }
    positionChild(1, Offset.zero);
    positionChild(2, const Offset(secondChildXOffset, 0));
  }

  @override
  bool shouldRelayout(covariant RowLayoutDelegate oldDelegate) {
    print(3);
    return false;
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum ScheduleRowWidgetConfigurationProgressStatus {
  oncoming,
  current,
  past,
}
