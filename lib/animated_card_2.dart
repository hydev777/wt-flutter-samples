import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedCard2 extends StatefulWidget {
  const AnimatedCard2({super.key});

  @override
  State<AnimatedCard2> createState() => _AnimatedCard2State();
}

class _AnimatedCard2State extends State<AnimatedCard2>
    with TickerProviderStateMixin {
  Alignment priceAlignment = Alignment.centerLeft;
  late final AnimationController _animationController;
  late final AnimationController _animationController2;
  late final Animation<Alignment> _alignmentAnimation;
  late final Animation<Alignment> _priceAlignmentAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _opacityContentAnimation;
  late final Animation<double> _fontSizeAnimation;
  late final Animation<double> _heightAnimation;
  late final Animation<double> _widthAnimation;
  late Animation<double> _rotationAnimation;

  String _card = "6756";

  final List<Map<String, dynamic>> _prices = [
    {
      "id": 1,
      "price": "50",
      "selected": true,
    },
    {
      "id": 2,
      "price": "100",
      "selected": false,
    },
    {
      "id": 3,
      "price": "300",
      "selected": false,
    },
  ];

  void selectPrice(int id) {
    int selectedIndex =
        _prices.indexWhere((price) => price['selected'] == true);
    _prices[selectedIndex]['selected'] = false;
    int indexChange = _prices.indexWhere((price) => price['id'] == id);
    _prices[indexChange]['selected'] = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 1),
    );

    _animationController2 = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 300),
    );

    _priceAlignmentAnimation = Tween<Alignment>(
      begin: Alignment.centerLeft,
      end: Alignment.topLeft,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.300,
          curve: Curves.easeInBack,
        ),
      ),
    );

    _alignmentAnimation = Tween<Alignment>(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );

    _heightAnimation = Tween<double>(
      begin: 65,
      end: 340,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );

    _widthAnimation = Tween<double>(
      begin: 250,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );

    _fontSizeAnimation = Tween<double>(
      begin: 18,
      end: 14,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );

    _opacityContentAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.300,
          0.500,
          curve: Curves.bounceIn,
        ),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: -4).animate(
      CurvedAnimation(
        parent: _animationController2,
        reverseCurve: Curves.easeInBack,
        curve: Curves.easeInBack,
      ),
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
                  color: const Color(0xFFFEFEFE),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                height: _heightAnimation.value,
                width: _widthAnimation.value,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: _opacityAnimation.value,
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
                      alignment: _priceAlignmentAnimation.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Wallet',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$34.00',
                            style: TextStyle(
                              fontSize: _fontSizeAnimation.value,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: _opacityContentAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Payment Mode',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            height: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F5FA),
                              borderRadius: BorderRadius.circular(10),
                              border: _card == "6756"
                                  ? Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: Colors.transparent,
                                    ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  fillColor: const WidgetStatePropertyAll(
                                      Colors.black),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _card = value!;
                                    });
                                  },
                                  value: "6756",
                                  groupValue: _card,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '****',
                                  textAlign: TextAlign.center,
                                ),
                                const Text('6756'),
                                const Spacer(),
                                const Icon(Icons.credit_card),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            height: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F5FA),
                              borderRadius: BorderRadius.circular(10),
                              border: _card == "4632"
                                  ? Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: Colors.transparent,
                                    ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  fillColor: const WidgetStatePropertyAll(
                                      Colors.black),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _card = value!;
                                    });
                                  },
                                  value: "4632",
                                  groupValue: _card,
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
                          const Text(
                            'Cash',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        priceAlignment = Alignment.centerLeft;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 180),
                                      height: 40,
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF6F5FA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '\$${_prices[0]['price']}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        priceAlignment = Alignment.center;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 180),
                                      height: 40,
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF6F5FA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '\$${_prices[1]['price']}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        priceAlignment = Alignment.centerRight;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 180),
                                      height: 40,
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF6F5FA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '\$${_prices[2]['price']}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedAlign(
                                  duration: const Duration(milliseconds: 180),
                                  alignment: priceAlignment,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 180),
                                    curve: Curves.bounceIn,
                                    height: 40,
                                    width: 80,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                        animation: _animationController2,
                        builder: (context, _) {
                          return Transform.rotate(
                            alignment: Alignment.centerLeft,
                            angle: _rotationAnimation.value / pi,
                            child: Align(
                              alignment: _alignmentAnimation.value,
                              child: SizedBox(
                                height: 40,
                                child: FilledButton.icon(
                                  icon: const Icon(Icons.add),
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.black)),
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
