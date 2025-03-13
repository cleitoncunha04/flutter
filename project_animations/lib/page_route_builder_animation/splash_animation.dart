import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  _toggleAnimation() {
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
        milliseconds: 1000,
      ),
      reverseDuration: const Duration(
        milliseconds: 500,
      ),
    )..addListener(() {
        if (animationController.isCompleted) {
          Navigator.of(context)
              .push(
                FadeRouteTransition(
                  route: const Destination(),
                ),
              )
              .then(
                (_) => animationController.value = 0,
              );
        }
      });

    scaleAnimation = Tween<double>(
      begin: 1,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
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
      body: Center(
        child: GestureDetector(
          onTap: () async {
            _toggleAnimation();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatefulWidget {
  const Destination({super.key});

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> reverseScaleAnimation;
  late final Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..addListener(() {
        if (animationController.isCompleted) {
          Navigator.of(context).pop();

          Timer(
            const Duration(
              milliseconds: 1000,
            ),
            () {
              animationController.reset();
            },
          );
        }
      });

    reverseScaleAnimation = Tween<double>(
      begin: 20,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCirc,
      ),
    );

    slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(
        0,
        -0.45,
      ),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => animationController.forward(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Go Back'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Center(
          child: ScaleTransition(
            alignment: Alignment.center,
            scale: reverseScaleAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FadeRouteTransition extends PageRouteBuilder {
  FadeRouteTransition({
    required this.route,
    this.duration = const Duration(
      milliseconds: 500,
    ),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Destination(),
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

  final Widget route;
  final Duration duration;
}
