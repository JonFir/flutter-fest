import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/schedule_row_session_widget.dart';

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
      progressStatus:
          ScheduleRowSessionWidgetConfigurationProgressStatus.oncoming,
    );
    return Row(
      children: const [
        Expanded(
          child: ScheduleRowSessionWidget(
            configuration: configuration,
          ),
        ),
      ],
    );
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
