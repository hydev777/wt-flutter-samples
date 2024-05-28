import 'package:flutter/material.dart';

import 'animated_align_text.dart';
import 'animated_arrows.dart';
import 'animated_button_1.dart';
import 'dynamic_check_mark.dart';
import 'flipping_cards.dart';
import 'half_circle.dart';
import 'presentation.dart';

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
                    builder: (BuildContext context) => const FlippingCard(),
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
                    builder: (BuildContext context) => const AnimatedButton1(),
                  ),
                );
              },
              child: const Text('Animated Button'),
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
                    builder: (BuildContext context) => const AnimatedAlignExample1(),
                  ),
                );
              },
              child: const Text('Animated Align 1'),
            ),
            const SizedBox(
              height: 5,
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AnimatedAlignText(),
                  ),
                );
              },
              child: const Text('Animated Align Text'),
            ),
          ],
        ),
      ),
    );
  }
}
