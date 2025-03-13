import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final List<Animation<Offset>> slideAnimations;
  int itemCount = 5;

  _startAnimation() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );

    slideAnimations = List.generate(
      itemCount,
      (index) => Tween<Offset>(
        begin: const Offset(-10, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          // Interval sets when the animation gonna start and end
          curve: Interval(
            index * (1 / itemCount),
            1,
            curve: Curves.easeOutExpo,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: slideAnimations[index],
            child: ListTile(
              title: Text('Hello World: ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: const Icon(Icons.done),
      ),
    );
  }
}
