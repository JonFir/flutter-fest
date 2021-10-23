import 'package:flutter/material.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight = 50;
  final double maxHeight = 300;

  // _SliverAppBarDelegate({
  //   required this.minHeight,
  //   required this.maxHeight,
  // });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Text("$shrinkOffset, $overlapsContent")
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
        SliverPersistentHeader(
          pinned: true,
          floating: true,
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
    );
  }
}
