import 'package:flutter/material.dart';

import 'animated_align_text.dart';
import 'animated_align_name.dart';
import 'animated_presentation_card.dart';
import 'animated_card_2.dart';
import 'animated_card_3.dart';
import 'animated_card_4.dart';
import 'animated_menu.dart';
import 'dynamic_check_mark.dart';
import 'flipping_cards.dart';
import 'half_circle.dart';
import 'presentation.dart';
import 'staggerered_menu.dart';
import 'swipe_cards.dart';
import 'three_d_planes.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    builder: (BuildContext context) => const AnimatedPresentationCard(),
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
                    builder: (BuildContext context) =>
                        const AnimatedMenu(),
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
            // const SizedBox(
            //   height: 5,
            // ),
            // FilledButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute<void>(
            //         builder: (BuildContext context) => const SwipeCards(),
            //       ),
            //     );
            //   },
            //   child: const Text('Swipe Cards'),
            // )
          ],
        ),
      ),
    );
  }
}
