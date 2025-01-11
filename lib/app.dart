import 'package:flutter/material.dart';

import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animations Examples'),
        ),
        body: const Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  spacing: 20,
                  children: <Widget>[
                    _CustomButton(
                      text: 'Flipping cards',
                      to: FlippingCards(),
                    ),
                    _CustomButton(
                      text: 'Rotating cards',
                      to: AnimatedRotatingCard(),
                    ),
                    _CustomButton(
                      text: 'Presentation',
                      to: Presentation(),
                    ),
                    _CustomButton(
                      text: 'Half Circle',
                      to: HalfCircle(),
                    ),
                    _CustomButton(
                      text: 'Animated Presentation Card',
                      to: AnimatedPresentationCard(),
                    ),
                    _CustomButton(
                      text: 'Dynamic Check Mark',
                      to: DynamicCheckMark(),
                    ),
                    _CustomButton(
                      text: 'Animated Align Name',
                      to: AnimatedAlignName(),
                    ),
                    _CustomButton(
                      text: 'Animated Align Text',
                      to: AnimatedAlignText(),
                    ),
                    _CustomButton(
                      text: '3D Planes',
                      to: ThreeDPlanes(),
                    ),
                    _CustomButton(
                      text: 'Animated Menu',
                      to: AnimatedMenu(),
                    ),
                    _CustomButton(
                      text: 'Staggered Menu Widget',
                      to: StaggeredMenu(),
                    ),
                    _CustomButton(
                      text: 'Expandable Credit Card',
                      to: AnimatedCard2(),
                    ),
                    _CustomButton(
                      text: 'Expandable Profile Card',
                      to: AnimatedCard3(),
                    ),
                    _CustomButton(
                      text: 'Expandable Task Card',
                      to: AnimatedCard4(),
                    ),
                    _CustomButton(
                      text: 'Rotating numbers',
                      to: AnimatedCircleNumbers(),
                    ),
                    _CustomButton(
                      text: 'Animated counter',
                      to: AnimatedCounter(),
                    ),
                    _CustomButton(
                      text: 'Animated Expandable Menu',
                      to: AnimatedExpandableMenu(),
                    ),
                    _CustomButton(
                      text: 'Animated Card Rotation',
                      to: AnimatedCard5(),
                    ),
                    _CustomButton(
                      text: 'Animated Card 6',
                      to: AnimatedCard6(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.text,
    required this.to,
  });

  final String text;
  final Widget to;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => to,
          ),
        );
      },
      child: Container(
        height: 50,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[200]!,
              offset: const Offset(0, 6),
              blurRadius: 10,
              spreadRadius: 0,
            )
          ],
          gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}