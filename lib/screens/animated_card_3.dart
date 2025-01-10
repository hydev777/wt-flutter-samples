import 'package:flutter/material.dart';

class AnimatedCard3 extends StatefulWidget {
  const AnimatedCard3({super.key});

  @override
  State<AnimatedCard3> createState() => _AnimatedCard3State();
}

class _AnimatedCard3State extends State<AnimatedCard3>
    with TickerProviderStateMixin {
  Alignment priceAlignment = Alignment.centerLeft;
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _opacityMoreAnimation;
  late final Animation<double> _heightAnimation;
  late final Animation<double> _widthAnimation;
  late final Animation<double> _topItemsPositionTop;
  late final Animation<double> item1PositionLeft;
  late final Animation<double> item2PositionLeft;
  late final Animation<double> item3PositionLeft;
  late final Animation<double> item4PositionLeft;
  late final Animation<BorderRadius> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 1),
    );

    _heightAnimation = Tween<double>(
      begin: 70,
      end: 340,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    _widthAnimation = Tween<double>(
      begin: 250,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    _borderRadiusAnimation = Tween<BorderRadius>(
      begin: const BorderRadius.all(Radius.circular(40)),
      end: const BorderRadius.all(Radius.circular(20)),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    _opacityMoreAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.10,
          curve: Curves.linear,
        ),
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.200,
          0.350,
          curve: Curves.easeIn,
        ),
      ),
    );

    _topItemsPositionTop = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    item1PositionLeft = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    item2PositionLeft = Tween<double>(begin: 50, end: 90).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    item3PositionLeft = Tween<double>(begin: 90, end: 160).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );

    item4PositionLeft = Tween<double>(begin: 130, end: 230).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.200,
          curve: Curves.decelerate,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Profile Card'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return GestureDetector(
              onTap: () {
                _animationController.forward();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFEFE),
                  borderRadius: _borderRadiusAnimation.value,
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    )
                  ],
                ),
                height: _heightAnimation.value,
                width: _widthAnimation.value,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Color(0xFFF7F6FB),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Voice Chat',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    _animationController.reverse();
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      color: Color(0xFFAFAFB3),
                                      Icons.close,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: _topItemsPositionTop.value,
                      child: SizedBox(
                        height: 80,
                        width: 300,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 21,
                              left: 190,
                              child: Opacity(
                                opacity: _opacityMoreAnimation.value,
                                child: const SizedBox(
                                  width: 50,
                                  child: Row(
                                    children: [
                                      Text(
                                        '+4',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Icon(
                                        Icons.expand_more,
                                        size: 22,
                                        color: Colors.black54,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Profile(
                              imageUrl:
                                  'https://static1.srcdn.com/wordpress/wp-content/uploads/2023/10/toji-smiles-in-jujutsu-kaisen.jpg',
                              left: item4PositionLeft.value,
                              name: 'Toji',
                              nameOpacity: _opacityAnimation.value,
                            ),
                            Profile(
                              imageUrl: 'https://i.redd.it/qq9g56ab20161.jpg',
                              left: item3PositionLeft.value,
                              name: 'Megumi',
                              nameOpacity: _opacityAnimation.value,
                            ),
                            Profile(
                              imageUrl:
                                  'https://miro.medium.com/v2/resize:fit:780/1*MKOcLJliGhE6ifa34SRZVw.jpeg',
                              left: item2PositionLeft.value,
                              name: 'Itadori',
                              nameOpacity: _opacityAnimation.value,
                            ),
                            Profile(
                              imageUrl:
                                  'https://miro.medium.com/v2/resize:fit:1400/0*ax6zaHxB7V-VpF7u.jpeg',
                              left: item1PositionLeft.value,
                              name: 'Sukuna',
                              nameOpacity: _opacityAnimation.value,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: SizedBox(
                          height: 80,
                          width: 300,
                          child: Stack(
                            children: [
                              Profile(
                                imageUrl:
                                    'https://www.mundodeportivo.com/alfabeta/hero/2023/10/satoru-gojo-se-ha-convertido-en-uno-de-los-personajes-mas-complejos-del-anime.jpg?width=1200',
                                left: 230,
                                name: 'Gojo',
                                nameOpacity: _opacityAnimation.value,
                              ),
                              Profile(
                                imageUrl:
                                    'https://hips.hearstapps.com/hmg-prod/images/jujutsu-kaisen-0-images-1647000118.jpg?crop=0.544xw:0.973xh;0.226xw,0&resize=768:*',
                                left: 160,
                                name: 'Yuta',
                                nameOpacity: _opacityAnimation.value,
                              ),
                              Profile(
                                imageUrl:
                                    'https://miro.medium.com/v2/resize:fit:736/1*GHQ2nQfaZyF81STYtlmAyA.jpeg',
                                left: 90,
                                name: 'Geto',
                                nameOpacity: _opacityAnimation.value,
                              ),
                              Profile(
                                imageUrl:
                                    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5c0ed54b-a511-4a68-be86-2ebbb1bfe82e/dghetyf-0ff4c70e-c366-4abb-a133-faf0bb5ef6dd.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzVjMGVkNTRiLWE1MTEtNGE2OC1iZTg2LTJlYmJiMWJmZTgyZVwvZGdoZXR5Zi0wZmY0YzcwZS1jMzY2LTRhYmItYTEzMy1mYWYwYmI1ZWY2ZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.eMltyrMFKM68bUlmCBoZ5fOW3iyJ93OoQL5eD1VZ8OM',
                                left: 20,
                                name: 'Nanami',
                                nameOpacity: _opacityAnimation.value,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 260,
                                child: FilledButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.black),
                                    shape: WidgetStatePropertyAll(
                                      ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Join Now'),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Mic will be muted initially',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.imageUrl,
    required this.left,
    required this.name,
    required this.nameOpacity,
  });

  final String imageUrl;
  final double left;
  final String name;
  final double nameOpacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: left,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color(0xFFFEFEFE),
                  width: 2,
                )),
          ),
          Name(
            label: name,
            opacity: nameOpacity,
          ),
        ],
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    super.key,
    required this.opacity,
    required this.label,
  });

  final double opacity;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }
}
