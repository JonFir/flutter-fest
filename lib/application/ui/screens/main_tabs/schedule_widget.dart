import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/widgets/dialogs/dialog_widget.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/schedule_row_break_widget.dart';
import 'package:flutter_fest/application/ui/widgets/shedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  void showOverlay(BuildContext context) {
    final configuration = DialogConfiguration(
      title: "Хотите получить напоминание за 10 минут до начала лекции?",
      actions: [
        DialogActionConfiguration("Не надо", true, () {
          Navigator.of(context).pop();
        }),
        DialogActionConfiguration("Да", false, () {}),
      ],
    );
    DialogWidget.show<void>(context, configuration);
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _LogoWidget(),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(topInset: topInset),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                showOverlay(context);
              },
              child: const Text("asdasds"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 2) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 14,
                      right: 14,
                    ),
                    child: SizedBox(
                      height: 70,
                      child: ScheduleRowBreakWidget(),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 20,
                    right: 20,
                  ),
                  child: ScheduleRowWidget.single(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 204,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(AppImages.sheduleBg),
            ),
            Positioned(
              left: 20,
              top: 84,
              child: Image.asset(AppImages.sheduleFfLogo),
            ),
            Positioned(
              right: 20,
              top: 64,
              child: Image.asset(AppImages.sheduleSurfLogo),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _height = 56;
  final double topInset;

  _SliverAppBarDelegate({required this.topInset});

  @override
  double get minExtent => _height + topInset;
  @override
  double get maxExtent => _height + topInset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _SectionButtonsWidget(
      topInset: topInset,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionButtonsWidget extends StatelessWidget {
  final double topInset;
  const _SectionButtonsWidget({
    Key? key,
    required this.topInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const totalItem = 4;
    const itemGradientWidth = 2;
    const halfItemGradientWidth = itemGradientWidth / 2;
    const endGradientPoint =
        totalItem * itemGradientWidth + halfItemGradientWidth;

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 20, right: 20, top: topInset),
        scrollDirection: Axis.horizontal,
        itemCount: totalItem,
        itemBuilder: (context, index) {
          final currentGradientStartPont =
              halfItemGradientWidth + index * itemGradientWidth;
          final currentGradientEndPont =
              endGradientPoint - currentGradientStartPont;
          return Center(
            child: SizedBox(
              height: 36,
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
                    gradient: LinearGradient(
                      begin: Alignment(-currentGradientStartPont, 0.0),
                      end: Alignment(currentGradientEndPont, 0.0),
                      colors: const <Color>[
                        AppColors.green,
                        AppColors.blue,
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Секция $index"),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
