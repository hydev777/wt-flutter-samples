import 'package:flutter/material.dart';

import 'screens/animated_align_text.dart';
import 'screens/animated_align_name.dart';
import 'screens/animated_card_5.dart';
import 'screens/animated_counter.dart';
import 'screens/animated_presentation_card.dart';
import 'screens/animated_card_2.dart';
import 'screens/animated_card_3.dart';
import 'screens/animated_card_4.dart';
import 'screens/animated_menu.dart';
import 'screens/animated_rotating_card.dart';
import 'screens/dynamic_check_mark.dart';
import 'screens/expandable_menu.dart';
import 'screens/flipping_cards.dart';
import 'screens/half_circle.dart';
import 'screens/numbers_circular_rotation.dart';
import 'screens/presentation.dart';
import 'screens/staggerered_menu.dart';
import 'screens/three_d_planes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations Examples'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const FlippingCards(),
                    ),
                  );
                },
                child: const Text('Flipping cards'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AnimatedRotatingCard(),
                    ),
                  );
                },
                child: const Text('Rotating cards'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Presentation(),
                    ),
                  );
                },
                child: const Text('Presentation'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HalfCircle(),
                    ),
                  );
                },
                child: const Text('Half Circle'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AnimatedPresentationCard(),
                    ),
                  );
                },
                child: const Text('Animated Presentation Card'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const DynamicCheckMark(),
                    ),
                  );
                },
                child: const Text('Dynamic Check Mark'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AnimatedAlignName(),
                    ),
                  );
                },
                child: const Text('Animated Align Name'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AnimatedAlignText(),
                    ),
                  );
                },
                child: const Text('Animated Align Text'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ThreeDPlanes(),
                    ),
                  );
                },
                child: const Text('3D Planes'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedMenu(),
                    ),
                  );
                },
                child: const Text('Animated Menu'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const StaggeredMenu(),
                    ),
                  );
                },
                child: const Text('Staggered Menu Widget'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedCard2(),
                    ),
                  );
                },
                child: const Text('Expandable Credit Card'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedCard3(),
                    ),
                  );
                },
                child: const Text('Expandable Profile Card'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedCard4(),
                    ),
                  );
                },
                child: const Text('Expandable Task Card'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AnimatedCircleNumbers(),
                    ),
                  );
                },
                child: const Text('Rotating numbers'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedCounter(),
                    ),
                  );
                },
                child: const Text('Animated counter'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedExpandableMenu(),
                    ),
                  );
                },
                child: const Text('Animated Expandable Menu'),
              ),
              const SizedBox(
                height: 5,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AnimatedCard5(),
                    ),
                  );
                },
                child: const Text('Animated Card Rotation'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
