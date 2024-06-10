import 'package:flutter/material.dart';

class SwipeCards extends StatefulWidget {
  const SwipeCards({super.key});

  @override
  State<SwipeCards> createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  final ScrollController _controller = ScrollController();
  List<Map<String, dynamic>> cards = [
    {
      "name": "Sukuna",
      "description":
          "The strongest jujutsu sorcerer from over a thousand years ago",
      "image":
          "https://miro.medium.com/v2/resize:fit:1400/0*ax6zaHxB7V-VpF7u.jpeg",
    },
    {
      "name": "Gojo",
      "description":
          "He is a special grade jujutsu sorcerer and widely recognized as the strongest in the world",
      "image":
          "https://www.mundodeportivo.com/alfabeta/hero/2023/10/satoru-gojo-se-ha-convertido-en-uno-de-los-personajes-mas-complejos-del-anime.jpg?width=1200",
    },
    {
      "name": "Yuta",
      "description":
          "He was initially a special grade cursed human haunted by his late childhood friend, Rika Orimoto",
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/jujutsu-kaisen-0-images-1647000118.jpg?crop=0.544xw:0.973xh;0.226xw,0&resize=768:*",
    },
    {
      "name": "Kenjaku",
      "description":
          "He is an ancient curse user who has existed for over a thousand years using his innate technique",
      "image":
          "https://zumaki.co.in/wp-content/uploads/2024/05/Each-Person-Kenjaku-has-possessed-so-far-in-the-Jujutsu-Kaisen.webp",
    }
  ];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      // print(_controller.initialScrollOffset);
      // print(_controller.position);
      print(_controller.position.context.notificationContext!.widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 280,
          width: 350,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final item = context.findRenderObject();

              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
