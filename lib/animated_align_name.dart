import 'package:flutter/material.dart';

class AnimatedAlignName extends StatefulWidget {
  const AnimatedAlignName({super.key});

  @override
  State<AnimatedAlignName> createState() => _AnimatedAlignNameState();
}

class _AnimatedAlignNameState extends State<AnimatedAlignName>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation1;
  late Animation _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _animation1 = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
    ).animate(_controller);

    _animation2 = Tween<Alignment>(
      begin: Alignment.topRight,
      end: Alignment.topLeft,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align Name'),
      ),
      body: Container(
        color: Colors.white,
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Stack(
                children: [
                  Align(
                    alignment: _animation2.value,
                    child: const Text(
                      'Junior',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Align(
                    alignment: _animation1.value,
                    child: const Text(
                      'Wilson',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_upward),
                          onPressed: () {
                            if (_animation2.value == Alignment.topLeft) {
                              _animation2 = Tween(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            } else if (_animation2.value ==
                                Alignment.bottomLeft) {
                              _animation2 = Tween(
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomRight,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            }

                            if (_animation1.value == Alignment.bottomLeft) {
                              _animation1 = Tween(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topLeft,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            } else if (_animation1.value ==
                                Alignment.bottomRight) {
                              _animation1 = Tween(
                                begin: Alignment.bottomRight,
                                end: Alignment.topRight,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            }

                            _controller
                              ..reset()
                              ..forward();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                if (_animation2.value ==
                                    Alignment.bottomRight) {
                                  _animation2 = Tween(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topRight,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                } else if (_animation2.value ==
                                    Alignment.bottomLeft) {
                                  _animation2 = Tween(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topLeft,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                }

                                if (_animation1.value == Alignment.topRight) {
                                  _animation1 = Tween(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                } else if (_animation1.value ==
                                    Alignment.bottomRight) {
                                  _animation1 = Tween(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.bottomLeft,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                }

                                _controller
                                  ..reset()
                                  ..forward();
                              },
                            ),
                            const SizedBox(
                            width: 30,
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                if (_animation2.value == Alignment.topRight) {
                                  _animation2 = Tween(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomRight,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                } else if (_animation2.value ==
                                    Alignment.topLeft) {
                                  _animation2 = Tween(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                }

                                if (_animation1.value == Alignment.topLeft) {
                                  _animation1 = Tween(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                } else if (_animation1.value ==
                                    Alignment.bottomLeft) {
                                  _animation1 = Tween(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.bottomRight,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.bounceOut,
                                    ),
                                  );
                                }

                                _controller
                                  ..reset()
                                  ..forward();
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            if (_animation2.value == Alignment.topRight) {
                              _animation2 = Tween(
                                begin: Alignment.topRight,
                                end: Alignment.topLeft,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            } else if (_animation2.value ==
                                Alignment.bottomRight) {
                              _animation2 = Tween(
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            }

                            if (_animation1.value == Alignment.topLeft) {
                              _animation1 = Tween(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            } else if (_animation1.value ==
                                Alignment.topRight) {
                              _animation1 = Tween(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                              ).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceOut,
                                ),
                              );
                            }

                            _controller
                              ..reset()
                              ..forward();
                          },
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
