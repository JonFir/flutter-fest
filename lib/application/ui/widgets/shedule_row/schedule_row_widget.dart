import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/navigation/main_navigation.dart';
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
    const progressStatus =
        ScheduleRowWidgetConfigurationProgressStatus.oncoming;
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl: 'https://klike.net/uploads/posts/2019-06/1560329641_2.jpg',
      speakerName: 'Алексей Чулпин',
      sessionTitle: 'Субьективность в оценке дизайна',
      isFavorite: true,
      progressStatus: progressStatus,
    );

    const ddd = ScheduleRowTimeWidgetConfiguration(
      startTime: "11:00",
      endTime: "12:00",
      progressStatus: progressStatus,
    );
    return Stack(
      children: [
        IntrinsicHeight(
          child: Row(
            children: const [
              ScheduleRowTimeWidget(
                configuration: ddd,
              ),
              SizedBox(width: 12),
              Expanded(
                child: ScheduleRowSessionWidget(
                  configuration: configuration,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () =>
                  Navigator.of(context).pushNamed(Screens.sessionDetials),
            ),
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

enum ScheduleRowWidgetConfigurationProgressStatus {
  oncoming,
  current,
  past,
}
