import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const ScheduleRowSessionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: configuration._style.widgetBackground,
        gradient: RadialGradient(
          center: Alignment.topRight,
          colors: [
            const Color(0xFF00B90D),
            configuration._style.widgetBackground,
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.only(left: 16, top: 4, right: 4, bottom: 16),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ), //all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _SpeakerWidget(
                  configuration: configuration,
                ),
              ),
              _FavoriteWidget(
                configuration: configuration,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _DescriptionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _SpeakerWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarSize = 24.0;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: Image.network(
            configuration.avatarUrl,
            height: avatarSize,
            width: avatarSize,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            configuration.speakerName,
            style: TextStyle(
              color: configuration._style.speakerNameColor,
              fontSize: 14,
              fontFamily: AppFonts.basisGrotesquePro,
              fontWeight: FontWeight.w500,
              height: 1.4285714286,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}

class _FavoriteWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _FavoriteWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        print("asdasdasd");
      },
      icon: Image.asset(
        configuration._favoriteStyle.favoriteButtonIcon,
        color: configuration._favoriteStyle.favoriteButtonColor,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _DescriptionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      configuration.sessionTitle,
      style: TextStyle(
        color: configuration._style.sessionTitleColor,
        fontSize: 18,
        fontFamily: AppFonts.steinbeck,
        height: 1.22,
      ),
    );
  }
}

enum ScheduleRowSessionWidgetConfigurationProgressStatus {
  oncoming,
  current,
  past
}

class _ScheduleRowSessionWidgetConfigurationProgressStyle {
  final Color widgetBackground;
  final Color speakerNameColor;
  final Color sessionTitleColor;

  const _ScheduleRowSessionWidgetConfigurationProgressStyle({
    required this.widgetBackground,
    required this.speakerNameColor,
    required this.sessionTitleColor,
  });
}

class _ScheduleRowSessionWidgetConfigurationFavoriteStyle {
  final Color? favoriteButtonColor;
  final Color? widgetBackgroundGradient;
  final String favoriteButtonIcon;

  const _ScheduleRowSessionWidgetConfigurationFavoriteStyle({
    required this.favoriteButtonColor,
    required this.widgetBackgroundGradient,
    required this.favoriteButtonIcon,
  });
}

class ScheduleRowSessionWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String sessionTitle;
  final bool isFavorite;
  final ScheduleRowSessionWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowSessionWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowSessionWidgetConfigurationProgressStatus.oncoming:
      case ScheduleRowSessionWidgetConfigurationProgressStatus.current:
        return oncomingStyle;
      case ScheduleRowSessionWidgetConfigurationProgressStatus.past:
        return pastStyle;
    }
  }

  _ScheduleRowSessionWidgetConfigurationFavoriteStyle get _favoriteStyle =>
      isFavorite ? isFavoriteStyle : isNotFavoriteStyle;

  const ScheduleRowSessionWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.sessionTitle,
    required this.isFavorite,
    required this.progressStatus,
  });

  static const oncomingStyle =
      _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Color(0xFF101115),
    speakerNameColor: Color(0xFF52525E),
    sessionTitleColor: Colors.white,
  );

  static const pastStyle = _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Colors.transparent,
    speakerNameColor: Color(0x7A52525E),
    sessionTitleColor: Color(0xFF52525E),
  );

  static const isFavoriteStyle =
      _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: Color(0xFF00BD13),
    widgetBackgroundGradient: Color(0xFF00BD13),
    favoriteButtonIcon: AppImages.bookmarkFull,
  );

  static const isNotFavoriteStyle =
      _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: null,
    widgetBackgroundGradient: null,
    favoriteButtonIcon: AppImages.bookmark,
  );
}
