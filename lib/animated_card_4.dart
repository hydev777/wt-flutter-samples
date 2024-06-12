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
        curve: Curves.easeIn,
      ),
    );

    _widthAnimation = Tween<double>(
      begin: 350,
      end: 350,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    item1PositionLeft = Tween<double>(begin: 255, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    item2PositionLeft = Tween<double>(begin: 280, end: 90).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    item3PositionLeft = Tween<double>(begin: 305, end: 170).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    item3PositionBottom = Tween<double>(begin: 10, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    item2PositionBottom = Tween<double>(begin: 10, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    item1PositionBottom = Tween<double>(begin: 10, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
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
                lerpDouble(10, 64, _animationController.value);
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
                                Colors.green,
                              ),
                              minHeight: 8,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '75%',
                            style: TextStyle(fontSize: 12),
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
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 3,
                              ),
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
                              Task(
                                isComplete: true,
                                label: 'Send Gojo',
                                onChanged: (value) {},
                              ),
                              Task(
                                isComplete: true,
                                label: 'Kill Kenjaku',
                                onChanged: (value) {},
                              ),
                              Task(
                                isComplete: true,
                                label: 'Send Yuta',
                                onChanged: (value) {},
                              ),
                              Task(
                                isComplete: false,
                                label: 'Purple',
                                onChanged: (value) {},
                              ),
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
                        'Kill Sukuna',
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
                          const SizedBox(
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
                          const SizedBox(
                            width: 35,
                          ),
                          StatusLabel(
                            label: 'Urgent',
                            backgroundColor: const Color(0xFFFFD3D5),
                            labelColor: const Color.fromARGB(255, 150, 0, 0),
                            opacity: _opacityAnimation.value,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: leftPosInProgress,
                      bottom: bottomPosInProgress,
                      child: Row(
                        children: [
                          const Icon(Icons.timelapse_outlined),
                          const SizedBox(
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
                          const SizedBox(
                            width: 40,
                          ),
                          StatusLabel(
                            label: 'In Progress',
                            backgroundColor: const Color(0xFFFFEAC5),
                            labelColor: const Color.fromARGB(255, 160, 136, 0),
                            opacity: _opacityAnimation.value,
                          ),
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

class StatusLabel extends StatelessWidget {
  const StatusLabel({
    super.key,
    required this.opacity,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
  });

  final double opacity;
  final String label;
  final Color backgroundColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: labelColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  const Task(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.isComplete});

  final bool isComplete;
  final String label;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isComplete,
          shape: const CircleBorder(),
          onChanged: onChanged,
        ),
        Text(label),
      ],
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
          const SizedBox(
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
