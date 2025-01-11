import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCard5 extends StatefulWidget {
  const AnimatedCard5({super.key});

  @override
  State<AnimatedCard5> createState() => _AnimatedCard5State();
}

class _AnimatedCard5State extends State<AnimatedCard5>
    with TickerProviderStateMixin {
  bool isBackCard = false;
  int index = 0;
  double dragStartPosition = 0.0;
  double dragEndPosition = 0.0;
  double currentLocalPosition = 0;
  double topPosition = 300;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final AnimationController _controller2 = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );
  late final Animation<double> rightPosition =
      Tween<double>(begin: 60, end: 250).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late Animation<double> topPositionMovement =
      Tween<double>(begin: 300, end: 300).animate(
    CurvedAnimation(
      parent: _controller2,
      curve: Curves.linear,
    ),
  );
  late Animation<double> leftPositionMovement =
      Tween<double>(begin: 80, end: -10).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late Animation<double> nameOpacity = Tween<double>(begin: 1, end: 0).animate(
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

  void _setTopPosition(double begin) {
    topPositionMovement = Tween<double>(begin: begin, end: 300).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.bounceOut,
      ),
    );
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    dragEndPosition = details.localPosition.dy;

    if (currentLocalPosition == 0) {
      currentLocalPosition = details.localPosition.dy;
    }

    if (details.localPosition.dy < currentLocalPosition) {
      setState(() {
        topPosition += 3;
      });
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (dragEndPosition > dragStartPosition) {
      currentLocalPosition = details.localPosition.dy;
    } else if (dragEndPosition < dragStartPosition) {
      currentLocalPosition = details.localPosition.dy;
      _setTopPosition(topPosition);
      currentLocalPosition = 0;
      _controller2.forward();
    }
  }

  void _onPanDown(DragDownDetails details) {
    if (details.localPosition.dy < 200) {
      if (_controller.isCompleted) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
  }

  void _onVerticalDragStart(DragStartDetails details) {
    dragStartPosition = details.localPosition.dy;
  }

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

    topPositionMovement.addListener(() {
      topPosition = topPositionMovement.value;
      if (topPositionMovement.value == 300) {
        _setTopPosition(300);
        if (topPositionMovement.status == AnimationStatus.completed) {
          if (index < (movies.length - 1)) {
            setState(() {
              index += 1;
            });
          } else {
            setState(() {
              index = 0;
            });
          }
          _controller2.reset();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
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
                    top: 430,
                    left: leftPositionMovement.value,
                    child: Opacity(
                      opacity: nameOpacity.value,
                      child: Text(
                        movies[index]['name'],
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                      animation: _controller2,
                      builder: (context, _) {
                        return Positioned(
                          top: topPosition,
                          right: rightPosition.value,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY((_controller.value * 2) * pi),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onVerticalDragStart: _onVerticalDragStart,
                              onVerticalDragUpdate: _onVerticalDragUpdate,
                              onVerticalDragEnd: _onVerticalDragEnd,
                              onPanDown: _onPanDown,
                              child: Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    height: 290,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            movies[index]['imageUrl']),
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
                                          height: 290,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                ],
              );
            }),
      ),
    );
  }
}
