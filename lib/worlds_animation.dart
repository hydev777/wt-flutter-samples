import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  double pageTransition = 0;
  int currentPage = 0;
  final PageController _pageController = PageController();
  late AnimationController _controller;
  late Animation<double> _rotation;
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 1),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  List<Map<String, dynamic>> planets = [
    {"name": "Saturn"},
    {"name": "Mars"},
    {"name": "Earth"},
    {"name": "Neptune"}
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rotation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(
      _controller,
    );

    _pageController.addListener(() {
      pageTransition = _pageController.page!;
      currentPage = _pageController.page!.truncate();
      print("currentTransition ====>> $currentPage");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 400,
              width: size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: planets.length,
                onPageChanged: (value) {
                  // print("================>>> $value");
                },
                itemBuilder: (context, index) {
                  if (index == currentPage) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        return SlideTransition(
                          position: _offsetAnimation,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..rotateZ(_controller.value),
                            child: Transform.rotate(
                              angle: pi * _rotation.value,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  planets[index]["name"],
                                  style: const TextStyle(fontSize: 38),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Transform(
                      transform: Matrix4.identity()..rotateZ(_controller.value),
                      child: Transform.rotate(
                        angle: pi * _rotation.value,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            planets[index]["name"],
                            style: const TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
