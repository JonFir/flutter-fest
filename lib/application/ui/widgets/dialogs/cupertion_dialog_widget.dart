import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';

class DialogActionConfiguration {
  final String title;
  final VoidCallback action;
  final bool isCancel;

  const DialogActionConfiguration(this.title, this.isCancel, this.action);
}

class CupertionDialogWidget extends StatelessWidget {
  final String title;
  final List<DialogActionConfiguration> actions;

  const CupertionDialogWidget({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionWidgets =
        actions.map((config) => _ActionWidget(configuration: config)).toList();
    return Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: _TitleWidget(title: title),
        actions: actionWidgets,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.dialogCancelAction,
    );
  }
}

class _ActionWidget extends StatelessWidget {
  final DialogActionConfiguration configuration;
  const _ActionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = configuration.isCancel
        ? AppTextStyle.dialogCancelAction
        : AppTextStyle.dialogAction;
    return TextButton(
      child: Text(
        configuration.title,
        style: style.copyWith(color: AppColors.green),
      ),
      onPressed: configuration.action,
    );
  }
}
