import 'package:flutter/material.dart';

import '../style/text.dart';
import '../style/padding.dart';
import '../../Animations/animation_builder.dart';
import '../../Animations/animations.dart';

class TextBox extends StatefulWidget {
  const TextBox({super.key});

  @override
  State<TextBox> createState() => _TextBoxState();
}

// Para que la clase pueda ejecutar las animaciones, debe incluir TickerProviderStateMixin.
class _TextBoxState extends State<TextBox> with TickerProviderStateMixin {
  late AnimationBuilder _animationBuilder;

  @override
  void initState() {
    super.initState();
    // Aquí inicializamos la animación. Puedes cambiar la duración de la animación.
    _animationBuilder = AnimationBuilder(
      animation: scaleAnimation,
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryPadding(
      // Este widget permite crear una acción cuando el usuario toca el widget.
      child: GestureDetector(
        // Aquí especifico que la acción se ejecute cuando se presiona una vez el widget.
        onTap: () {
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
          child: TextWidget(
            texto: 'Sin Botón',
            // Aquí especifico que este widget use un color específico del tema que creamos en main.
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
