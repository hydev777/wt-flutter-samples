import 'dart:ui';

import 'package:flutter/material.dart';

class DynamicCheckMark extends StatefulWidget {
  const DynamicCheckMark({super.key});

  @override
  State<DynamicCheckMark> createState() => _DynamicCheckMarkState();
}

class _DynamicCheckMarkState extends State<DynamicCheckMark> {
  List<Item> items = [
    Item(name: 'Wilsonveloper', selected: false),
    Item(name: 'Diegoveloper', selected: false),
    Item(name: 'Junioveloper', selected: false),
    Item(name: 'Juanveloper', selected: false),
    Item(name: 'Pedroveloper', selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Check Mark'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: items[index],
            onSelect: (value) {
              setState(() {
                items[index] = items[index].copyWith(
                  selected: value,
                );
              });
            },
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    required this.item,
    required this.onSelect,
  });

  final Item item;
  final Function(bool?) onSelect;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          double value = 0;
          if (_controller.status == AnimationStatus.forward) {
            value = Curves.easeOut.transform(_controller.value);
          } else if (_controller.status == AnimationStatus.reverse) {
            value = Curves.easeIn.transform(_controller.value);
          } else {
            value = Curves.easeInOut.transform(_controller.value);
          }
          final scale = lerpDouble(1.0, 1.4, value);
          final fontSize = lerpDouble(18, 26, value);
          final fontWeight =
              FontWeight.lerp(FontWeight.normal, FontWeight.bold, value);
          final borderWidth = lerpDouble(2, 4, value);
          final selectColor = Color.lerp(Colors.black, Colors.amber, value);

          return Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Transform.scale(
                  scale: scale,
                  child: Checkbox(
                    activeColor: selectColor,
                    value: widget.item.selected,
                    side: BorderSide(
                      color: selectColor!,
                      width: borderWidth!,
                    ),
                    onChanged: (bool? value) {
                      widget.onSelect(value);

                      if (value ?? false) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    },
                  ),
                ),
              ),
              Text(
                widget.item.name,
                style: TextStyle(
                  color: selectColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Item {
  Item({
    required this.name,
    required this.selected,
  });

  final String name;
  final bool selected;

  Item copyWith({
    String? name,
    bool? selected,
  }) {
    return Item(
      name: name ?? this.name,
      selected: selected ?? this.selected,
    );
  }
}
