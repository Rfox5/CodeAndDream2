import 'package:flutter/material.dart';

import '../../Widgets/style/padding.dart';
import '../../Animations/animation_builder.dart';
import '../../Animations/animations.dart';

class CardWAnimation extends StatefulWidget {
  const CardWAnimation({super.key});

  @override
  State<CardWAnimation> createState() => _CardWAnimationState();
}

// Para que la clase pueda ejecutar las animaciones, debe incluir TickerProviderStateMixin.
class _CardWAnimationState extends State<CardWAnimation>
    with TickerProviderStateMixin {
  late AnimationBuilder _animationBuilder;

  @override
  void initState() {
    super.initState();
    // Aquí inicializamos la animación, puedes cambiar la duración de la animación.
    _animationBuilder = AnimationBuilder(
      animation: rotateAndScaleAnimation,
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryPadding(
      // Debes envolver el widget que mostrará la animación en un AnimatedBuilder.
      child: AnimatedBuilder(
        // Asignas el controlador de la animación.
        animation: _animationBuilder.controller,
        // Envías el widget al controlador.
        builder: (context, child) {
          return _animationBuilder.buildAnimation(child!);
        },
        // Este es el widget que queremos animar.
        child: Card(
          child: ListTile(
            // Este es el ícono a la izquierda de la tarjeta.
            leading: const Icon(Icons.precision_manufacturing_sharp),
            // Este es el valor superior de la tarjeta.
            title: const Text("Nombre"),
            // Este es el valor inferior de la tarjeta.
            subtitle: const Text("Empresa"),
            // Este es el ícono a la derecha que realiza una acción al ser presionado.
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _animationBuilder.startAnimation(() {
                    // Redibuja el widget cuando la animación termina. Aquí podrías colocar la acción que desees que se ejecute cuando la animación acabe.
                    // Por ejemplo, podrías navegar a otra pantalla o incrementar algún contador en la pantalla.
                    setState(() {});
                  });
                });
              },
              icon: Icon(
                Icons.auto_fix_normal_outlined,
                // Aquí especifico que este widget use un color específico del tema que creamos en main.
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
