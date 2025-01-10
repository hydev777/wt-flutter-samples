import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCard6 extends StatefulWidget {
  const AnimatedCard6({super.key});

  @override
  State<AnimatedCard6> createState() => _AnimatedCard6State();
}

class _AnimatedCard6State extends State<AnimatedCard6>
    with TickerProviderStateMixin {
  bool isBackCard = false;
  int index = 0;
  double dragStartPosition = 0.0;
  double dragEndPosition = 0.0;
  double currentLocalPosition = 0;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final Animation<double> rightPosition =
      Tween<double>(begin: 60, end: 250).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late final Animation<double> topPosition =
      Tween<double>(begin: 20, end: 340).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late Animation<double> leftPosition =
      Tween<double>(begin: 200, end: 80).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late Animation<double> nameOpacity = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late Animation<double> cardSize = Tween<double>(begin: 1, end: 2.5).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  List<Map<String, dynamic>> movies = [
    {
      "name": "The Godfather",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/b5282f72126e4919911509e034a61f66_6ce2486d-e0da-4b7a-9148-722cdde610b8_500x749.jpg?v=1573616025",
    },
    {
      "name": "The shawshank redemption",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/shawshank_eb84716b-efa9-44dc-a19d-c17924a3f7df_500x749.jpg?v=1709821984",
    },
    {
      "name": "Back to the future",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/backtofuture.mpw_500x749.jpg?v=1708444122",
    },
    {
      "name": "Home alone",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/homealone.124915_500x749.jpg?v=1723662930",
    },
    {
      "name": "The dark knight",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/darkknight.building.24x36_20e90057-f673-4cc3-9ce7-7b0d3eeb7d83_500x749.jpg?v=1707491191",
    },
    {
      "name": "Jurassic park",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/jurassicpark.mpw_500x749.jpg?v=1713805481",
    },
    {
      "name": "Star wars",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/6cd691e19fffbe57b353cb120deaeb8f_8489d7bf-24ba-4848-9d0f-11f20cb35025_500x749.jpg?v=1573613877",
    },
    {
      "name": "GoodFellas",
      "imageUrl":
          "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/Goodfellas.mpw.116119_500x749.jpg?v=1731338435",
    }
  ];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      double rotation = (_controller.value * 2);

      if (rotation >= 0.5 || rotation <= 1.5) {
        setState(() {
          isBackCard = true;
        });
      }

      if (rotation > 1.5 || rotation < 0.5) {
        setState(() {
          isBackCard = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated card'),
        ),
        body: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Stack(
                children: [
                  Positioned(
                    top: 300,
                    left: leftPosition.value,
                    child: Opacity(
                      opacity: nameOpacity.value,
                      child: Text(
                        movies[index]['name'],
                      ),
                    ),
                  ),
                  Positioned(
                    top: topPosition.value,
                    right: rightPosition.value,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY((_controller.value * 2) * pi),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onPanDown: (details) {
                          if (details.localPosition.dy > 200) {
                          } else {
                            if (_controller.isCompleted) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                          }
                        },
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              height: 170 * cardSize.value,
                              width: 120 * cardSize.value,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(movies[index]['imageUrl']),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              alignment: Alignment.center,
                            ),
                            isBackCard
                                ? Container(
                                    height: 170 * cardSize.value,
                                    width: 120 * cardSize.value,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
