import 'package:flutter/material.dart';

import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/resources/resources.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: _AddToFavoriteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
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
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
    );
  }
}
