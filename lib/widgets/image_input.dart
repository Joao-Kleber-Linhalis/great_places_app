import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  
  File? _storedImage;

  _takePicture() async {
    final ImagePicker _imagePicker = ImagePicker(); //Instancia a api necessária para acessar a camera
    XFile imageFile = await _imagePicker.pickImage( //acessa a camera e retorna o File da foto tirada
      source: ImageSource.camera,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path); //salva o caminho da foto tirada
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory(); //pega o diretório do app, no caso o Great_places
    String fileName = path.basename(_storedImage!.path); //Pega o nome do arquivo da foto tirada
    final savedImage = await _storedImage!.copy( //copia a foto tirada para dentro do diretório do app
      '${appDir.path}/$fileName',
    );
    widget.onSelectImage(savedImage); //devolve o path para o novo diretório da foto tirada
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.5,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: size.width * 0.5,
                  fit: BoxFit.fill,
                )
              : Text("Nenhuma imagem!"),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera_alt),
            label: Text(
              "Tirar Foto",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
