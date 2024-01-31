import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width*0.5,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: Text("Nenhuma imagem!"),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera_alt),
            label: Text(
              "Tirar Foto",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
