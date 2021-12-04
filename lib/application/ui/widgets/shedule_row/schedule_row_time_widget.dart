import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  const ScheduleRowTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: AppFonts.basisGrotesquePro,
      fontWeight: FontWeight.w500,
      height: 1.3,
    );
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "8:00",
              style: textStyle,
              maxLines: 1,
            ),
            Text(
              "10:30",
              style: textStyle,
              maxLines: 1,
            ),
          ],
        ),
        SizedBox(
          width: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
          ),
        ),
      ],
    );
  }
}
