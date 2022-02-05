import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

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

class DialogConfiguration {
  final String title;
  final List<DialogActionConfiguration> actions;

  DialogConfiguration({
    required this.title,
    required this.actions,
  });
}

class DialogWidget extends StatelessWidget {
  final DialogConfiguration configuration;
  const DialogWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialod = Platform.isIOS
        ? _CupertionDialogWidget(configuration: configuration)
        : _MaterialDialogWidget(configuration: configuration);
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3,
        sigmaY: 3,
      ),
      child: Theme(
        data: ThemeData.dark(),
        child: dialod,
      ),
    );
  }

  static Future<T?> show<T>(
    BuildContext context,
    DialogConfiguration configuration,
  ) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (_) => DialogWidget(configuration: configuration),
    );
  }
}

class _MaterialDialogWidget extends StatelessWidget {
  final DialogConfiguration configuration;

  const _MaterialDialogWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionWidgets = configuration.actions
        .map((config) => _ActionWidget(configuration: config))
        .toList();
    return AlertDialog(
      title: _TitleWidget(title: configuration.title),
      actions: actionWidgets,
    );
  }
}

class _CupertionDialogWidget extends StatelessWidget {
  final DialogConfiguration configuration;

  const _CupertionDialogWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionWidgets = configuration.actions
        .map((config) => _ActionWidget(configuration: config))
        .toList();
    return CupertinoAlertDialog(
      title: _TitleWidget(title: configuration.title),
      actions: actionWidgets,
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
