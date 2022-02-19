import 'package:flutter/material.dart';

import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/themes/app_theme.dart';
import 'package:flutter_fest/resources/resources.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _AddToFavoriteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxScreenWidth),
          child: ListView(
            children: const [
              _HeaderWidget(),
              _SessionTitleWidget(),
              _SessionDescriptionWidget(),
              _ScheduleInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddToFavoriteWidgetConfiguration {
  final String text;
  final String icon;
  final Color iconColor;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradiend;

  static const favorite = _AddToFavoriteWidgetConfiguration(
    text: "В программе",
    icon: AppImages.bookmarkFull,
    iconColor: AppColors.green,
    backgroundColor: AppColors.darkSecondary,
    backgroundGradiend: null,
  );

  static const disFavorite = _AddToFavoriteWidgetConfiguration(
    text: "В мою программу",
    icon: AppImages.bookmark,
    iconColor: AppColors.white88,
    backgroundColor: null,
    backgroundGradiend: LinearGradient(
      colors: <Color>[
        AppColors.green,
        AppColors.blue,
      ],
    ),
  );

  const _AddToFavoriteWidgetConfiguration({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.backgroundGradiend,
  });
}

class _AddToFavoriteWidget extends StatelessWidget {
  final isFavorite = true;
  const _AddToFavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configuration = isFavorite
        ? _AddToFavoriteWidgetConfiguration.favorite
        : _AddToFavoriteWidgetConfiguration.disFavorite;
    return SizedBox(
      height: 48,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxScreenWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                elevation: MaterialStateProperty.all(0),
                minimumSize: MaterialStateProperty.all(Size.zero),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: configuration.backgroundGradiend,
                  color: configuration.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        configuration.icon,
                        color: configuration.iconColor,
                      ),
                      const SizedBox(width: 16),
                      Text(configuration.text),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _SpeakerInfoWidget(),
      ],
    );
  }
}

class _SpeakerInfoWidget extends StatelessWidget {
  const _SpeakerInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 312,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 124),
                Flexible(
                  flex: 56,
                  child: Text(
                    "Алексей\nЧулпин",
                    style: AppTextStyle.speakerName.copyWith(
                      color: AppColors.white88,
                    ),
                  ),
                ),
                const Spacer(flex: 24),
                Flexible(
                  flex: 40,
                  child: Text(
                    "Ведущий\nразработчик МТС",
                    style: AppTextStyle.bookTextItalic.copyWith(
                      color: AppColors.white88,
                    ),
                  ),
                ),
                const Spacer(flex: 68),
              ],
            ),
          ),
          const Placeholder(),
        ],
      ),
    );
  }
}

class _SessionTitleWidget extends StatelessWidget {
  const _SessionTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 32, right: 20),
      child: Text(
        "Субьективность в оценке дизайна",
        style: AppTextStyle.steinbeckText.copyWith(
          color: AppColors.white88,
        ),
      ),
    );
  }
}

class _SessionDescriptionWidget extends StatelessWidget {
  const _SessionDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
      child: Text(
        "Текст описание краткое лекции. Что будет, раскрытие темы. Думаю, что на три или четыре строки. текста нет, так что пишу, что думаю бла бла бла...",
        style: AppTextStyle.bookText.copyWith(
          color: AppColors.white88,
        ),
      ),
    );
  }
}

class _ScheduleInfoWidget extends StatelessWidget {
  const _ScheduleInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
