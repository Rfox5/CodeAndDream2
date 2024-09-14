import 'package:flutter/material.dart';

import '../../Widgets/style/padding.dart';

// Cuando tu app use el mismo widget varias veces, es una buena idea crear una clase y reutilizarla.
// De esta forma, centralizas y uniformas esta información.
// Puedes personalizar a tu gusto cuántos atributos serán necesarios para configurar el widget.
// En este caso, personalizo el widget que envuelve el Text por color.
class TextWidget extends StatelessWidget {
  final String texto;
  final Color? color;
  const TextWidget({
    super.key,
    required this.texto,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: TextPadding(
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ),
    );
  }
}
