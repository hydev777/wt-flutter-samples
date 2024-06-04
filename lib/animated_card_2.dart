import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedCard2 extends StatefulWidget {
  const AnimatedCard2({super.key});

  @override
  State<AnimatedCard2> createState() => _AnimatedCard2State();
}

class _AnimatedCard2State extends State<AnimatedCard2>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _animationController2;
  late final Tween<Alignment> _alignmentAnimation;
  late final Tween<Alignment> _priceAlignmentAnimation;
  late final Tween<double> _opacityAnimation;
  late final Tween<double> _fontSizeAnimation;
  late final Tween<double> _heightAnimation;
  late final Tween<double> _widthAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController2 = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 400),
    );

    _priceAlignmentAnimation = Tween(
      begin: Alignment.centerLeft,
      end: Alignment.topLeft,
    )..animate(_animationController);

    _alignmentAnimation = Tween(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    )..animate(_animationController);

    _heightAnimation = Tween(
      begin: 60,
      end: 340,
    )..animate(_animationController);

    _widthAnimation = Tween(
      begin: 250,
      end: 300,
    )..animate(_animationController);

    _fontSizeAnimation = Tween(
      begin: 22,
      end: 16,
    )..animate(_animationController);

    _opacityAnimation = Tween(
      begin: 0,
      end: 1,
    )..animate(_animationController);

    _rotationAnimation = Tween<double>(begin: 0, end: -4).animate(
      _animationController2,
    );

    _animationController2.addListener(() {
      if (_animationController2.value > 0.5 &&
          _rotationAnimation.status == AnimationStatus.forward) {
        _animationController2.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                height: _heightAnimation.evaluate(_animationController),
                width: _widthAnimation.evaluate(_animationController),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: _opacityAnimation.evaluate(_animationController),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            _animationController.reverse();
                            _animationController2.reverse();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: _priceAlignmentAnimation
                          .evaluate(_animationController),
                      child: Text(
                        '\$34.00',
                        style: TextStyle(
                          fontSize:
                              _fontSizeAnimation.evaluate(_animationController),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _opacityAnimation.evaluate(_animationController),
                      child: _animationController.status ==
                              AnimationStatus.completed
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Payment Mode',
                                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio(
                                        onChanged: (value) {},
                                        value: true,
                                        groupValue: {},
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        '****',
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text('4632'),
                                      const Spacer(),
                                      const Icon(Icons.credit_card),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Radio(
                                      onChanged: (value) {},
                                      value: true,
                                      groupValue: const {},
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '****',
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text('4632'),
                                    const Spacer(),
                                    const Icon(Icons.credit_card),
                                  ],
                                ),
                                const Text(
                                  'Cash',
                                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        '\$50',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        '\$100',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        '\$300',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    Opacity(
                      opacity: _opacityAnimation.evaluate(_animationController),
                      child: _animationController.status ==
                              AnimationStatus.completed
                          ? const Center(
                              child: SizedBox(
                                height: 150,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                    AnimatedBuilder(
                        animation: _animationController2,
                        builder: (context, _) {
                          return Transform.rotate(
                            alignment: Alignment.centerLeft,
                            angle: _rotationAnimation.value / pi,
                            child: Align(
                              alignment: _alignmentAnimation
                                  .evaluate(_animationController),
                              child: SizedBox(
                                height: 40,
                                child: FilledButton.icon(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    _animationController.forward();
                                    _animationController2.forward();
                                  },
                                  label: const Text('Add Cash'),
                                ),
                              ),
                            ),
                          );
                        }),
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
