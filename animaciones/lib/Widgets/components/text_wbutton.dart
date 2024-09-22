import 'package:flutter/material.dart';

import '../style/padding.dart';
import '../style/text.dart';
import '../../Animations/animation_builder.dart';
import '../../Animations/animations.dart';

class TextWButton extends StatefulWidget {
  const TextWButton({super.key});

  @override
  State<TextWButton> createState() => _TextWButtonState();
}

// Para que la clase pueda ejecutar las animaciones, debe incluir TickerProviderStateMixin.
class _TextWButtonState extends State<TextWButton>
    with TickerProviderStateMixin {
  late AnimationBuilder _animationBuilder;

  @override
  void initState() {
    super.initState();
    // Aquí inicializamos la animación. Puedes cambiar la duración de la animación.
    _animationBuilder = AnimationBuilder(
      animation: slideOutAnimation,
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryPadding(
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
              texto: "Con Botón",
              // Aquí especifico que este widget use un color específico del tema que creamos en main.
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        ButtonPadding(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _animationBuilder.startAnimation(() {
                    // Redibuja el widget cuando la animación termina. Aquí podrías colocar la acción que desees que se ejecute cuando la animación acabe.
                    // Por ejemplo, podrías navegar a otra pantalla o incrementar algún contador en la pantalla.
                    setState(() {});
                  });
                });
              },
              child: const Text("Animar")),
        )
      ],
    );
  }
}
