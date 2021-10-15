import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/my_app/my_app.dart';

void main() {
  final app = MyApp();
  runApp(app);
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight = 50;
//   final double maxHeight = 300;
//
//   // _SliverAppBarDelegate({
//   //   required this.minHeight,
//   //   required this.maxHeight,
//   // });
//
//   @override
//   double get minExtent => minHeight;
//   @override
//   double get maxExtent => maxHeight;
//
//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return ColoredBox(
//       color: Colors.white,
//       child: Column(
//         children: [
//           const Expanded(child: SizedBox()),
//           Text("$shrinkOffset, $overlapsContent")
//         ],
//       ),
//     );
//   }
//
//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight;
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         bottom: false,
//         child: CustomScrollView(
//           slivers: [
//             SliverPersistentHeader(
//               pinned: true,
//               delegate: _SliverAppBarDelegate(),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   Container(color: Colors.pink, height: 150.0),
//                   Container(color: Colors.cyan, height: 150.0),
//                   Container(color: Colors.indigo, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.pink, height: 150.0),
//                   Container(color: Colors.cyan, height: 150.0),
//                   Container(color: Colors.indigo, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                   Container(color: Colors.blue, height: 150.0),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
