import 'package:flutter/material.dart';

// Es una buena idea mantener uniformes los espacios entre los diferentes elementos de tu interfaz.
// Como muchos elementos compartirán los mismos atributos, es mejor crear una clase y reutilizarla.
// De esta forma, centralizas la información y solo debes cambiar un atributo para que toda la app se actualice.

class TextPadding extends StatelessWidget {
  final Widget child;

  const TextPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: child,
    );
  }
}

class PrimaryPadding extends StatelessWidget {
  final Widget child;

  const PrimaryPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 15,
      ),
      child: child,
    );
  }
}

class ButtonPadding extends StatelessWidget {
  final Widget child;

  const ButtonPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: child,
    );
  }
}
