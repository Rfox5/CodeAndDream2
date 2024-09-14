import 'package:flutter/material.dart';

import '../../Widgets/style/padding.dart';
import '../../Animations/animation_builder.dart';
import '../../Animations/animations.dart';

class ImageWAnimation extends StatefulWidget {
  const ImageWAnimation({super.key});

  @override
  State<ImageWAnimation> createState() => _ImageWAnimationState();
}

// Para que la clase pueda ejecutar las animaciones, debe incluir TickerProviderStateMixin.
class _ImageWAnimationState extends State<ImageWAnimation>
    with TickerProviderStateMixin {
  late AnimationBuilder _animationBuilder;

  @override
  void initState() {
    super.initState();
    // Aquí inicializamos la animación. Puedes cambiar la duración de la animación.
    _animationBuilder = AnimationBuilder(
      animation: flipHorizontalAnimation,
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryPadding(
      // Este widget permite crear una acción cuando el usuario toca el widget.
      child: GestureDetector(
        // Aquí especifico que la acción se ejecute cuando se presiona dos veces el widget.
        onDoubleTap: () {
          setState(() {
            _animationBuilder.startAnimation(() {
              // Redibuja el widget cuando la animación termina. Aquí podrías colocar la acción que desees que se ejecute cuando la animación acabe.
              // Por ejemplo, podrías navegar a otra pantalla o incrementar algún contador en la pantalla.
              setState(() {});
            });
          });
        },
        // Debes envolver el widget que mostrará la animación en un AnimatedBuilder.
        child: AnimatedBuilder(
          // Asignas el controlador de la animación.
          animation: _animationBuilder.controller,
          // Envías el widget al controlador.
          builder: (context, child) {
            return _animationBuilder.buildAnimation(child!);
          },
          // Este es el widget que queremos animar.
          child: Container(
              width: 250,
              // Aquí especifico que este widget use un color específico del tema que creamos en main.
              color: Theme.of(context).canvasColor,
              child: Image.asset("assets/mugiwara.png")),
        ),
      ),
    );
  }
}
