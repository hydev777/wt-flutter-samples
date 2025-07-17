import 'package:flutter/material.dart';

class AnimatedList1 extends StatefulWidget {
  const AnimatedList1({super.key});

  @override
  State<AnimatedList1> createState() => _AnimatedList1State();
}

class _AnimatedList1State extends State<AnimatedList1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          constraints: const BoxConstraints(
            minHeight: 400,
            minWidth: 300,
          ),
          child: const Column(
            children: [AnimatedExpandedContainer()],
          ),
        ),
      ),
    );
  }
}

class AnimatedExpandedContainer extends StatefulWidget {
  const AnimatedExpandedContainer({
    super.key,
  });

  @override
  State<AnimatedExpandedContainer> createState() =>
      _AnimatedExpandedContainerState();
}

class _AnimatedExpandedContainerState extends State<AnimatedExpandedContainer>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  bool showList = false;
  late final AnimationController _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ));
  late final Animation<double> _containerHeight =
      Tween<double>(begin: 60, end: 160).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    ),
  );

  @override
  void initState() {
    super.initState();

    _animationController.addListener(() {
      if (_animationController.value > 0.5) {
        setState(() {
          showList = true;
        });
      } else {
        setState(() {
          showList = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Container(
            height: _containerHeight.value,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('mOnday'),
                      Switch(
                        value: isExpanded,
                        onChanged: (value) {
                          if (isExpanded) {
                            _animationController.reverse();
                          } else {
                            _animationController.forward();
                          }

                          setState(() {
                            isExpanded = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 0,
                  left: 0,
                  child: showList
                      ? const SizedBox(
                          height: 100,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        });
  }
}

class AnimatedListOfItems extends StatefulWidget {
  const AnimatedListOfItems({super.key});

  @override
  State<AnimatedListOfItems> createState() => _AnimatedListOfItemsState();
}

class _AnimatedListOfItemsState extends State<AnimatedListOfItems> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ["Item 1"];

  void _addItem() {
    final int index = _items.length;
    _items.add("Item ${index + 1}");
    _listKey.currentState?.insertItem(
      index,
      duration: const Duration(milliseconds: 600), // Duration of the animation
    );
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildAnimatedItem(removedItem, animation),
      duration: const Duration(milliseconds: 600),
    );
  }

  Widget _buildAnimatedItem(String item, Animation<double> animation) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    );

    return SizeTransition(
      sizeFactor: curvedAnimation,
      axis: Axis.vertical,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeItem(_items.indexOf(item)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return _buildAnimatedItem(_items[index], animation);
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _addItem,
            child: const Text('Add Item'),
          ),
        ),
      ],
    );
  }
}
