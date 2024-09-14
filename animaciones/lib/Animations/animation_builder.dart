import 'package:flutter/material.dart';

// Esta clase será reutilizable para cualquier widget.
class AnimationBuilder {
  final AnimationController controller;
  // Este parámetro es el widget con la animación que deseamos implementar.
  final Widget Function(Widget, AnimationController) animation;
  AnimationBuilder(
      {required this.animation,
      required TickerProvider vsync,
      required Duration duration})
      : controller = AnimationController(vsync: vsync, duration: duration);

  // Método para iniciar la animación.
  void startAnimation(VoidCallback onCompleted) {
    controller.forward().then((_) {
      onCompleted();
      controller.reset(); // Restablece la animación.
    });
  }

  // Método para construir la animación.
  Widget buildAnimation(Widget child) {
    return animation(child, controller);
  }
}
