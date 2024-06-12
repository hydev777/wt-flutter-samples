import 'package:flutter/material.dart';

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({super.key});

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Menu'),
      ),
      body: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedCategory(
              options: const [
                'Health',
                'Practices',
                'Drugs',
                'Medicine',
              ],
              tittle: 'HEALTHCARE',
              backgroundColor: Colors.blue[200]!,
              titleColor: Colors.blue[900]!,
            ),
            AnimatedCategory(
              options: const [
                'Best Ingredients',
                'Recipes',
                'Spicy',
                'Meat',
                'Sweet',
              ],
              tittle: 'FOOD & DRINK',
              backgroundColor: Colors.green,
              titleColor: Colors.yellow[700]!,
            ),
            AnimatedCategory(
              options: const [
                'Make Up',
                'Stylish',
                'Faces',
                'Dressess'
              ],
              tittle: 'BEAUTY',
              backgroundColor: Colors.pink[100]!,
              titleColor: Colors.pink,
            ),
            AnimatedCategory(
              options: const [
                'Baby Shower',
                'Toys',
                'Games',
                'Early Learning',
                'Baby food',
                'Clothes',
              ],
              tittle: 'BABY & KIDS',
              backgroundColor: Colors.blue[900]!,
              titleColor: Colors.pink[100]!,
            ),
            AnimatedCategory(
              options: const [
                'Furnaces',
                'Couch',
                'Designs',
                'Colors',
                'Combinations',
                'Internals',
              ],
              tittle: 'HOMEWARES',
              backgroundColor: Colors.yellow[700]!,
              titleColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCategory extends StatefulWidget {
  const AnimatedCategory({
    super.key,
    required this.options,
    required this.tittle,
    required this.backgroundColor,
    required this.titleColor,
  }) : super();

  final List<String> options;
  final String tittle;
  final Color backgroundColor;
  final Color titleColor;

  @override
  State<AnimatedCategory> createState() => _AnimatedCategoryState();
}

class _AnimatedCategoryState extends State<AnimatedCategory>
    with SingleTickerProviderStateMixin {
  bool expand = false;
  late final AnimationController _controller;
  late final Animation<double> curve;
  late final Tween<double> _topPadding;
  late final Tween<double> _height;
  late final Tween<double> _titleTopPositioned;
  late final Tween<double> _opacity;
  int totalItemHeight = 0;
  int maxContainerHeight = 0;

  @override
  void initState() {
    super.initState();

    if (widget.options.isNotEmpty) {
      totalItemHeight = (widget.options.length * 34);
      maxContainerHeight = ((totalItemHeight / 2) + 100).toInt();
    } else {
      maxContainerHeight = 100;
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    curve = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _opacity = Tween(begin: 0, end: 1)..animate(_controller);

    _height = Tween(begin: 100, end: maxContainerHeight.toDouble())
      ..animate(curve);
    _topPadding = Tween(begin: 0, end: 20)..animate(_controller);
    _titleTopPositioned = Tween(begin: 30, end: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        setState(() {});
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              height: _height.evaluate(curve),
              color: widget.backgroundColor,
              padding: EdgeInsets.only(
                left: 20,
                top: _topPadding.evaluate(_controller),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: _titleTopPositioned.evaluate(_controller),
                    child: Text(
                      widget.tittle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: widget.titleColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    child: Opacity(
                      opacity: _opacity.evaluate(_controller),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.options
                            .map(
                              (option) => Text(
                                option,
                                style: TextStyle(
                                  color: widget.titleColor,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
