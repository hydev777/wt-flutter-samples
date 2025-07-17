import 'dart:math' as math;

import 'package:flutter/material.dart';

class BalanceCardAnimation extends StatefulWidget {
  const BalanceCardAnimation({super.key});

  @override
  State<BalanceCardAnimation> createState() => _BalanceCardAnimationState();
}

class _BalanceCardAnimationState extends State<BalanceCardAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late final AnimationController _controller3 = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<double> _bottomWhiteCard = Tween<double>(
    begin: 70,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.elasticInOut,
    ),
  );
  late final Animation<double> _widthWhiteCard = Tween<double>(
    begin: 290,
    end: 180,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.elasticInOut,
    ),
  );
  late final Animation<double> _bottomGreenCard = Tween<double>(
    begin: 120,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller2,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.elasticInOut,
    ),
  );
  late final Animation<double> _widthGreenCard = Tween<double>(
    begin: 290,
    end: 140,
  ).animate(
    CurvedAnimation(
      parent: _controller2,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.elasticInOut,
    ),
  );
  late final Animation<double> _bottomPurpleCard = Tween<double>(
    begin: 170,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller3,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.elasticInOut,
    ),
  );
  late final Animation<double> _widthPurpleCard = Tween<double>(
    begin: 290,
    end: 100,
  ).animate(
    CurvedAnimation(
      parent: _controller3,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.elasticInOut,
    ),
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(() {
        if (_controller.value > 0.05 &&
            _controller.status == AnimationStatus.forward) {
          _controller2.forward();
        }

        if (_controller.isCompleted) {
          _controller.reverse();
        }
      });

      _controller2.addListener(() {
        if (_controller2.value > 0.05 &&
            _controller2.status == AnimationStatus.forward) {
          _controller3.forward();
        }

        if (_controller2.isCompleted) {
          _controller2.reverse();
        }
      });

      _controller3.addListener(() {
        if (_controller3.isCompleted) {
          _controller3.reverse();
        }
      });

      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEFCF),
      appBar: AppBar(
        title: const Text('Balance Card Animation'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
              top: Radius.circular(30),
            ),
          ),
          height: 400,
          width: 350,
          child: Stack(
            children: [
              AnimatedBuilder(
                  animation: _controller3,
                  builder: (context, _) {
                    return Positioned(
                      bottom: _bottomPurpleCard.value,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            color: Colors.purple[200]!,
                          ),
                          height: 200,
                          width: _widthPurpleCard.value,
                          child: Column(
                            children: [],
                          ),
                        ),
                      ),
                    );
                  }),
              AnimatedBuilder(
                  animation: _controller2,
                  builder: (context, _) {
                    return Positioned(
                      bottom: _bottomGreenCard.value,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            color: Colors.green[500]!,
                          ),
                          height: 200,
                          width: _widthGreenCard.value,
                          child: Column(
                            children: [],
                          ),
                        ),
                      ),
                    );
                  }),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return Positioned(
                      bottom: _bottomWhiteCard.value,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          height: 200,
                          width: _widthWhiteCard.value,
                          child: Column(
                            children: [],
                          ),
                        ),
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    ),
                    color: const Color(0xFF1E2E13),
                    border: Border.all(
                      color: Colors.white30,
                      width: 1,
                    ),
                  ),
                  height: 200,
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        '* * * * * * * *',
                        style:
                            TextStyle(color: Colors.green[400], fontSize: 20),
                      ),
                      Text(
                        'Total Balance',
                        style:
                            TextStyle(color: Colors.green[400], fontSize: 16),
                      ),
                      const Spacer(),
                      Icon(Icons.visibility_off,
                          color: Colors.green[100], size: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BounceOutCustomCurve extends Curve {
  const BounceOutCustomCurve([this.period = 0.4]);

  final double period;

  @override
  double transform(double t) {
    final double s = period / 4.0;
    t = 2 * t - 1.0;
    if (t < 0.00) {
      return -0.5 *
          math.pow(2.0, 10.0 * t) *
          math.sin((t - s) * (math.pi * 2.0) / period);
    } else {
      return math.pow(2.0, -10.0 * t) *
              math.sin((t - s) * (math.pi * 2.0) / period) *
              0.5 +
          1.0;
    }
  }
}
