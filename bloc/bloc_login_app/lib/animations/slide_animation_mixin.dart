import 'package:flutter/material.dart';

mixin SlideAnimationMixin<T extends StatefulWidget> on State<T> {
  late final AnimationController animationController;
  late final Animation<Offset> slideAnimation;

  TickerProvider get tickerProvider => this as TickerProvider;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 1000),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutExpo,
      ),
    );
  }

  void startAnimation() {
    // Inicia a animação
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
