import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  const ScheduleRowSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101115),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: const [
              _SpeakerWidget(),
              _FavoriteWidget(),
            ],
          ),
          const _DescriptionWidget(),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  const _SpeakerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarSize = 24.0;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: Image.network(
            'https://klike.net/uploads/posts/2019-06/1560329641_2.jpg',
            height: avatarSize,
            width: avatarSize,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Иннокентий Христорожденныйвсубботу",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: AppFonts.basisGrotesquePro,
            fontWeight: FontWeight.w500,
            height: 1.4285714286,
          ),
        ),
      ],
    );
  }
}

class _FavoriteWidget extends StatelessWidget {
  const _FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
