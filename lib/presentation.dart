import 'package:flutter/material.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presentation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ShakeTransition(
              duration: const Duration(milliseconds: 1100),
              offset: -200,
              axis: Axis.vertical,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/11/gojo-satoru.jpg'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShakeTransition(
              axis: Axis.horizontal,
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInCubic,
              child: Text(
                '''Satoru Gojo (五ご条じょう悟さとる Gojō Satoru?) is one of the main protagonists of the Jujutsu Kaisen series. He is a special grade jujutsu sorcerer and widely recognized as the strongest in the world. Satoru is the pride of the Gojo Clan, the first person to inherit both the Limitless and the Six Eyes in four hundred years. He works as a teacher at the Tokyo Jujutsu High and uses his influence to protect and train strong young allies. ''',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShakeTransition(
              duration: const Duration(milliseconds: 1100),
              axis: Axis.vertical,
              curve: Curves.bounceIn,
              child: FilledButton(
                child: const Text('Press'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  const ShakeTransition({
    super.key,
    required this.child,
    required this.duration,
    this.offset = 140,
    this.axis = Axis.horizontal,
    this.curve = Curves.bounceOut,
  });

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(
                  value * offset,
                  0.0,
                )
              : Offset(
                  0.0,
                  value * offset,
                ),
          child: child,
        );
      },
      child: child,
    );
  }
}
