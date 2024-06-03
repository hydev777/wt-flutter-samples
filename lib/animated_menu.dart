import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            color: Colors.blue[200],
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'HEALTHCARE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.green,
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'FOOD & DRINK',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[700],
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.pink[100],
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'BEAUTY',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          AnimatedCategory(
            options: const [
              'TEST',
            ],
            tittle: 'BABY & KIDS',
            backgroundColor: Colors.blue[900]!,
            titleColor: Colors.pink[100]!,
          ),
          AnimatedCategory(
            options: const [
              'TEST',
              'TEST',
              'TEST',
              'TEST',
              'TEST',
              'TEST',
              'TEST'
            ],
            tittle: 'HOMEWARES',
            backgroundColor: Colors.yellow[700]!,
            titleColor: Colors.white,
          ),
        ],
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
  late final Tween<double> _topPadding;
  late final Tween<double> _height;
  late final Tween<double> _titleTopPositioned;
  late final Tween<double> _optionsTopPositioned;
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
      duration: const Duration(milliseconds: 200),
    );

    print(maxContainerHeight);

    _height = Tween(begin: 100, end: maxContainerHeight.toDouble())
      ..animate(_controller);
    _topPadding = Tween(begin: 0, end: 20)..animate(_controller);
    _titleTopPositioned = Tween(begin: 30, end: 0);
    _optionsTopPositioned = Tween(begin: 30, end: 35);
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
              height: _height.evaluate(_controller),
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
                  _controller.isCompleted
                      ? Positioned(
                          top: _optionsTopPositioned.evaluate(_controller),
                          child: Column(
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
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          }),
    );
  }
}
