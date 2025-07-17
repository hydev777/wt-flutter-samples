import 'package:flutter/material.dart';

class AnimatedHorizontalList extends StatefulWidget {
  const AnimatedHorizontalList({super.key});

  @override
  State<AnimatedHorizontalList> createState() => AnimatedHorizontalListState();
}

class AnimatedHorizontalListState extends State<AnimatedHorizontalList>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  final pageController = PageController(initialPage: 0, viewportFraction: 0.6);
  List<Color> colors = [
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 400,
            child: PageView.builder(
              itemCount: 6,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colors[index],
                  ),
                  height: 260,
                  width: 180,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
