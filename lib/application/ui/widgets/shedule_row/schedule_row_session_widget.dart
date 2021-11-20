import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  const ScheduleRowSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101115),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.only(left: 16, top: 4, right: 4, bottom: 16),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ), //all(20),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: _SpeakerWidget(),
              ),
              _FavoriteWidget(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: _DescriptionWidget(),
          ),
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
        const Expanded(
          child: Text(
            "Иннокентий Христорожденныйвсубботу",
            style: TextStyle(
              color: Colors.white,
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
  const _FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        print("asdasdasd");
      },
      icon: Image.asset(AppImages.bookmark),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Субьективность в оценке дизайна",
      style: TextStyle(
        color: Colors.white.withOpacity(0.88),
        fontSize: 18,
        fontFamily: AppFonts.steinbeck,
        height: 1.22,
      ),
    );
  }
}
