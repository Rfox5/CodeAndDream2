import 'package:flutter/material.dart';

// Aquí encontrarás diferentes animaciones. Te invito a cambiar los valores numéricos para ver cómo funcionan las animaciones.

Widget fadeAnimation(Widget child, AnimationController controller) {
  return FadeTransition(
    opacity: Tween<double>(begin: 1.0, end: 0.0).animate(controller),
    child: child,
  );
}

Widget scaleAnimation(Widget child, AnimationController controller) {
  return ScaleTransition(
    scale: Tween<double>(begin: 1.0, end: 0.0).animate(controller),
    child: child,
  );
}

Widget slideOutAnimation(Widget child, AnimationController controller) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(controller),
    child: child,
  );
}

Widget rotateAndScaleAnimation(Widget child, AnimationController controller) {
  return RotationTransition(
    turns: controller,
    child: ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 0.0).animate(controller),
      child: child,
    ),
  );
}

Widget flipHorizontalAnimation(Widget child, AnimationController controller) {
  return AnimatedBuilder(
    animation: controller,
    builder: (context, child) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(3.14 * controller.value),
        child: child,
      );
    },
    child: child,
  );
}
