import 'package:flutter/material.dart';

import '../Widgets/components/text_box.dart';
import '../Widgets/components/text_wbutton.dart';
import '../Widgets/components/card_wanimation.dart';
import '../Widgets/components/image_wanimation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SafeArea asegura que la parte superior de la pantalla, donde están la hora y la batería, quede despejada.
    return const SafeArea(
        child: Scaffold(
      // Este Widget permite que, en caso de que nuestra app ocupe más espacio del disponible, el contenido se pueda deslizar.
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // Aquí organizo el contenido de la columna para que distribuya sus elementos con espacios entre los widgets.
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextBox(),
              // Esto crea una línea horizontal que separa los widgets.
              Divider(),
              TextWButton(),
              Divider(),
              CardWAnimation(),
              Divider(),
              ImageWAnimation(),
            ],
          ),
        ),
      ),
    ));
  }
}
