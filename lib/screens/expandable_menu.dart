import 'package:flutter/material.dart';

class AnimatedExpandableMenu extends StatefulWidget {
  const AnimatedExpandableMenu({super.key});

  @override
  State<AnimatedExpandableMenu> createState() => _AnimatedExpandableMenuState();
}

class _AnimatedExpandableMenuState extends State<AnimatedExpandableMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final Animation<double> containerWidth =
      Tween<double>(begin: 110, end: 300).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    ),
  );
  late final Animation<double> containerHeight =
      Tween<double>(begin: 50, end: 280).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    ),
  );
  late final Animation<double> containerRadius =
      Tween<double>(begin: 40, end: 20).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  late final iconOpacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        0.4,
        curve: Curves.decelerate,
      ),
    ),
  );
  late final contentOpacity = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.5,
        1,
        curve: Curves.linear,
      ),
    ),
  );
  late final closeButtonOpacity = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          1,
          curve: Curves.decelerate,
        ),
        reverseCurve: const Interval(
          0.8,
          1,
          curve: Curves.decelerate,
        )),
  );
  late final closeButtonTopPosition = Tween<double>(
    begin: 60,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ),
  );
  late final item1Opacity = Tween<double>(
    begin: 0.8,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.5,
        1,
        curve: Curves.decelerate,
      ),
    ),
  );
  late final item2Opacity = Tween<double>(
    begin: 0.6,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.6,
        1,
        curve: Curves.decelerate,
      ),
    ),
  );
  late final item3Opacity = Tween<double>(
    begin: 0.4,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.7,
        1,
        curve: Curves.decelerate,
      ),
    ),
  );
  late final item4Opacity = Tween<double>(
    begin: 0.2,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.8,
        1,
        curve: Curves.decelerate,
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable Menu'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  double value = _controller.value;
                  final selectColor =
                      Color.lerp(Colors.grey[300], Colors.white, value);
                  final borderColor =
                      Color.lerp(Colors.grey[300], Colors.grey[400], value);

                  return Center(
                    child: SizedBox(
                      height: containerHeight.value + 110,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: closeButtonTopPosition.value,
                            child: Opacity(
                              opacity: closeButtonOpacity.value,
                              child: GestureDetector(
                                onTap: () {
                                  _controller.reverse();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.grey[300],
                                  ),
                                  height: 45,
                                  width: 60,
                                  child: Icon(
                                    Icons.close,
                                    size: 24,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:
                                _controller.status != AnimationStatus.completed
                                    ? () {
                                        _controller.forward();
                                      }
                                    : null,
                            child: Container(
                              height: containerHeight.value,
                              width: containerWidth.value,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selectColor,
                                borderRadius: BorderRadius.circular(
                                    containerRadius.value),
                                border: Border.all(
                                  color: borderColor!,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  value > 0.5
                                      ? Opacity(
                                          opacity: contentOpacity.value,
                                          child: ListView(
                                            children: [
                                              Opacity(
                                                opacity: item1Opacity.value,
                                                child: const ListTile(
                                                  leading: Icon(Icons.task),
                                                  title: Text('Task'),
                                                  subtitle:
                                                      Text('Create a new task'),
                                                ),
                                              ),
                                              Opacity(
                                                opacity: item2Opacity.value,
                                                child: const ListTile(
                                                  leading:
                                                      Icon(Icons.notifications),
                                                  title: Text('Reminder'),
                                                  subtitle: Text(
                                                      'Create reminders with alerts'),
                                                ),
                                              ),
                                              Opacity(
                                                opacity: item3Opacity.value,
                                                child: const ListTile(
                                                  leading: Icon(Icons.note),
                                                  title: Text('Note'),
                                                  subtitle: Text(
                                                      'Capture ideas on the fly'),
                                                ),
                                              ),
                                              Opacity(
                                                opacity: item4Opacity.value,
                                                child: const ListTile(
                                                  leading: Icon(Icons.folder),
                                                  title: Text('Project'),
                                                  subtitle: Text(
                                                      'Organise better with projects'),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: value > 0.4
                                        ? const SizedBox.shrink()
                                        : Opacity(
                                            opacity: iconOpacity.value,
                                            child: Icon(
                                              Icons.add,
                                              size: 32,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
