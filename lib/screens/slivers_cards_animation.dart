import 'package:flutter/material.dart';

class SliversCardsAnimation extends StatefulWidget {
  const SliversCardsAnimation({super.key});

  @override
  State<SliversCardsAnimation> createState() => _SliversCardsAnimationState();
}

class _SliversCardsAnimationState extends State<SliversCardsAnimation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Transform(
              transform: Matrix4.identity()..scale(1.0, 0.98),
              child: const SliverItem(),
            );
          },
        ),
      ),
    );
  }
}

class SliverItem extends StatefulWidget {
  const SliverItem({super.key});

  @override
  State<SliverItem> createState() => _SliverItemState();
}

class _SliverItemState extends State<SliverItem> {
  late final ScrollController _controller = ScrollController();
  double currentOffset = 0.0;
  double padding = 5;
  double actionsPadding = 10;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.offset < 40) {
        if (_controller.offset > currentOffset) {
          currentOffset = _controller.offset;

          if (padding > 0) {
            setState(() {
              padding = padding - 1.0;
            });
          }

          if (actionsPadding > 0) {
            setState(() {
              actionsPadding = actionsPadding - 1;
            });
          }
        } else {
          currentOffset = _controller.offset;

          if (padding < 6) {
            setState(() {
              padding = padding + 1.0;
            });
          }

          if (actionsPadding < 11) {
            setState(() {
              actionsPadding = actionsPadding + 1;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: ListView(
              controller: _controller,
              children: [
                Container(
                  height: 600,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/book_1.JPG'),
                          ),
                        ),
                        height: 280,
                        width: 200,
                      ),
                      const Text(
                        'Flutter Animations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Diegoveloper',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.green[200],
                          ),
                          Text(
                            '5 (652)',
                            style: TextStyle(color: Colors.green[200]),
                          ),
                          Text(
                            '* Education',
                            style: TextStyle(color: Colors.green[200]),
                          )
                        ],
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Book',
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              '220 Pages',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              spacing: 6,
                              children: [
                                Expanded(
                                  child: FilledButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.green[300]),
                                      shape: WidgetStatePropertyAll(
                                        ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Sample'),
                                  ),
                                ),
                                Expanded(
                                  child: FilledButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.white),
                                      shape: WidgetStatePropertyAll(
                                        ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Get',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.only(left: 15),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From the publisher',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ''',
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Requirements',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RequirementWidget(),
                          RequirementWidget(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Versions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Updated Mar 16 2022',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: actionsPadding,
              vertical: 10,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _controller.animateTo(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    );
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RequirementWidget extends StatelessWidget {
  const RequirementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text('Test'),
        Text(
          'It is a long established fact that a reader will be distracted. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
