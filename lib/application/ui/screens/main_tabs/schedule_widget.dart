import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ddd = MediaQuery.of(context).padding.top;

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.sheduleBg),
          fit: BoxFit.none,
          alignment: Alignment.topLeft,
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const _LogoWidget(),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.pink, height: 150.0),
                  Container(color: Colors.cyan, height: 150.0),
                  Container(color: Colors.indigo, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.pink, height: 150.0),
                  Container(color: Colors.cyan, height: 150.0),
                  Container(color: Colors.indigo, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                ],
              ),
            ),
          ],
        ),
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
        height: 200,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 40,
              child: Image.asset(AppImages.sheduleFfLogo),
            ),
            Positioned(
              right: 20,
              top: 20,
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

  @override
  double get minExtent => _height;
  @override
  double get maxExtent => _height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const _SectionButtonsWidget();
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionButtonsWidget extends StatelessWidget {
  const _SectionButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xFF00BD13), Color(0xFF170AF4)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
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
    );
  }
}
