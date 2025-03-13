import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0,
            end: 200,
          ),
          duration: const Duration(
            milliseconds: 3000,
          ),
          curve: Curves.elasticOut,
          builder: (BuildContext context, double size, Widget? child) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: size / 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
