import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedCard4 extends StatefulWidget {
  const AnimatedCard4({super.key});

  @override
  State<AnimatedCard4> createState() => _AnimatedCard4State();
}

class _AnimatedCard4State extends State<AnimatedCard4>
    with TickerProviderStateMixin {
  Alignment priceAlignment = Alignment.centerLeft;
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _heightAnimation;
  late final Animation<double> _widthAnimation;
  late final Animation<double> item1PositionLeft;
  late final Animation<double> item2PositionLeft;
  late final Animation<double> item3PositionLeft;
  late final Animation<double> item1PositionBottom;
  late final Animation<double> item2PositionBottom;
  late final Animation<double> item3PositionBottom;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 250),
      duration: const Duration(milliseconds: 250),
    );

    _heightAnimation = Tween<double>(
      begin: 90,
      end: 400,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    _widthAnimation = Tween<double>(
      begin: 350,
      end: 350,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0.200,
        //   0.350,
        //   curve: Curves.linear,
        // ),
      ),
    );

    item1PositionLeft = Tween<double>(begin: 255, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    item2PositionLeft = Tween<double>(begin: 280, end: 90).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    item3PositionLeft = Tween<double>(begin: 305, end: 170).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    item3PositionBottom = Tween<double>(begin: 10, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    item2PositionBottom = Tween<double>(begin: 10, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );

    item1PositionBottom = Tween<double>(begin: 10, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        // curve: const Interval(
        //   0,
        //   0.200,
        //   curve: Curves.decelerate,
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            final bottomPosUrgent =
                lerpDouble(10, 90, _animationController.value);
            final bottomPosInProgress =
                lerpDouble(10, 55, _animationController.value);
            final leftPosInProgress =
                lerpDouble(80, 10, _animationController.value);
            final rightPosProgress =
                lerpDouble(10, 140, _animationController.value);
            final topPosProgress =
                lerpDouble(10, 62, _animationController.value);
            final titleFontSize =
                lerpDouble(14, 22, _animationController.value);
            final titleFontWeight = FontWeight.lerp(
                FontWeight.normal, FontWeight.bold, _animationController.value);
            final decorationLerp = BoxDecoration.lerp(
              BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5),
              ),
              BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              _animationController.value,
            );
            final topTitleIconPos =
                lerpDouble(13, 20, _animationController.value);
            final leftTitleIconPos =
                lerpDouble(16, 12, _animationController.value);

            return GestureDetector(
              onTap: () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFEFE),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    )
                  ],
                ),
                height: _heightAnimation.value,
                width: _widthAnimation.value,
                child: Stack(
                  children: [
                    // Positioned(
                    //   top: 20,
                    //   right: 10,
                    //   child: Opacity(
                    //     opacity: _opacityAnimation.value,
                    //     child: Container(
                    //       width: 32,
                    //       height: 32,
                    //       padding: const EdgeInsets.all(5),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(6),
                    //         border: Border.all(
                    //           color: Colors.black12,
                    //           width: 1,
                    //         ),
                    //       ),
                    //       child: const Icon(
                    //         color: Colors.black,
                    //         Icons.more_horiz,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      right: rightPosProgress,
                      top: topPosProgress,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: LinearProgressIndicator(
                              value: 0.7,
                              borderRadius: BorderRadius.circular(10),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.green),
                              minHeight: 8,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '75%',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 60,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Container(
                          width: 210,
                          height: 25,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.black12,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                size: 16,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '3 of 4',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        width: 138,
                        height: 30,
                        padding: const EdgeInsets.all(4),
                        decoration: decorationLerp,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 100,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Container(
                          width: 200,
                          height: 150,
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    shape: CircleBorder(),
                                    onChanged: (value) {},
                                  ),
                                  Text('Design Tokens'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    shape: CircleBorder(),
                                    onChanged: (value) {},
                                  ),
                                  Text('Color System'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    shape: CircleBorder(),
                                    onChanged: (value) {},
                                  ),
                                  Text('Type System'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: false,
                                    shape: CircleBorder(),
                                    onChanged: (value) {},
                                  ),
                                  Text('Documentation'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: leftTitleIconPos,
                      top: topTitleIconPos,
                      child: const Icon(Icons.computer_rounded),
                    ),
                    Positioned(
                      left: 50,
                      top: 16,
                      child: Text(
                        'Design System',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: titleFontWeight,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: bottomPosUrgent,
                      child: Row(
                        children: [
                          const Icon(Icons.flag),
                          SizedBox(
                            width: 5,
                          ),
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 400),
                            firstChild: const Text(
                              'Priority',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            secondChild: const Text(
                              'Urgent',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            crossFadeState: _opacityAnimation.status ==
                                        AnimationStatus.forward ||
                                    _opacityAnimation.isCompleted
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                          // Name(
                          //   label: _opacityAnimation.isCompleted
                          //       ? 'Priority'
                          //       : 'Urgent',
                          //   opacity: 1,
                          // ),
                          SizedBox(
                            width: 35,
                          ),
                          Opacity(
                            opacity: _opacityAnimation.value,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFFD3D5),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    'Urgent',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: leftPosInProgress,
                      bottom: bottomPosInProgress,
                      child: Row(
                        children: [
                          const Icon(Icons.timelapse_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 400),
                            firstChild: const Text(
                              'Status',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            secondChild: const Text(
                              'In Progress',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            crossFadeState: _opacityAnimation.status ==
                                        AnimationStatus.forward ||
                                    _opacityAnimation.isCompleted
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Opacity(
                            opacity: _opacityAnimation.value,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFFEAC5),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    'In Progress',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Profile(
                      imageUrl: 'https://i.redd.it/qq9g56ab20161.jpg',
                      left: item3PositionLeft.value,
                      bottom: item3PositionBottom.value,
                      name: 'Megumi',
                      nameOpacity: _opacityAnimation.value,
                    ),
                    Profile(
                      imageUrl:
                          'https://miro.medium.com/v2/resize:fit:780/1*MKOcLJliGhE6ifa34SRZVw.jpeg',
                      left: item2PositionLeft.value,
                      bottom: item2PositionBottom.value,
                      name: 'Itadori',
                      nameOpacity: _opacityAnimation.value,
                    ),
                    Profile(
                      imageUrl:
                          'https://miro.medium.com/v2/resize:fit:1400/0*ax6zaHxB7V-VpF7u.jpeg',
                      left: item1PositionLeft.value,
                      bottom: item1PositionBottom.value,
                      name: 'Sukuna',
                      nameOpacity: _opacityAnimation.value,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.imageUrl,
    required this.left,
    required this.bottom,
    required this.name,
    required this.nameOpacity,
  });

  final String imageUrl;
  final double left;
  final double bottom;
  final String name;
  final double nameOpacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: const Color(0xFFFEFEFE),
                width: 2,
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Name(
            label: name,
            opacity: nameOpacity,
          ),
        ],
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    super.key,
    required this.opacity,
    required this.label,
  });

  final double opacity;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
        ),
      ),
    );
  }
}
