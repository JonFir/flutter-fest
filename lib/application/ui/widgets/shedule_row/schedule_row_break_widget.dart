import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';

class ScheduleRowBreakWidget extends StatelessWidget {
  const ScheduleRowBreakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: _BreakDecoratorWidget(reversed: true),
        ),
        const SizedBox(width: 13),
        Text(
          "ПЕРЕРЫВ",
          style: AppTextStyle.breakTimeSmall.copyWith(
            color: AppColors.white88,
          ),
        ),
        const SizedBox(width: 13),
        const Expanded(
          child: _BreakDecoratorWidget(reversed: false),
        ),
      ],
    );
  }
}

class _BreakDecoratorWidget extends StatelessWidget {
  final bool reversed;

  const _BreakDecoratorWidget({
    Key? key,
    required this.reversed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 7.0),
      painter: _BreakDecoratorPainter(reversed),
    );
  }
}

class _BreakDecoratorPainter extends CustomPainter {
  final bool reversed;

  const _BreakDecoratorPainter(this.reversed);

  @override
  void paint(Canvas canvas, Size size) {
    const spaceWidth = 6.96;
    const itemWidth = 2.96;
    const itemOffset = 7.13;
    final paint = Paint()
      ..color = AppColors.darkText
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final itemsCount = (size.width / itemOffset).floor() + 1;
    final margin = reversed ? size.width - ((itemsCount - 1) * itemOffset) : 0;
    for (var i = 0; i < itemsCount; i++) {
      final xOffset = spaceWidth * i + margin;
      final start = Offset(xOffset + itemWidth, 0);
      final end = Offset(xOffset, size.height);

      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BreakDecoratorPainter oldDelegate) {
    return oldDelegate.reversed != reversed;
  }
}
