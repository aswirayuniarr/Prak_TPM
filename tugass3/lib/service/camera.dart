import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tugass3/service/image_picker_helper.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Access"),
      ),
      body: Container(
        child: Column(
          children: [
            _imageSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttonGallery(),
                _buttonCamera(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    if (file.isEmpty) {
      return Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/f/fa/Boy_Pablo_Piknik_i_Parken_2019_%28170641%29.jpg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      );
    } else {
      return Image.file(
        File(file),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      );
    }
  }

  void _processImage(String? filePath) {
    if (filePath != null) {
      setState(() {
        file = filePath;
      });
    }
    ;
  }

  Widget _buttonGallery() {
    return ElevatedButton(
      onPressed: () {
        ImagePickerHelper().imagePickerFromGallery((filePath) {
          _processImage(filePath);
        });
      },
      child: Text("From Gallery"),
    );
  }

  Widget _buttonCamera() {
    return ElevatedButton(
      onPressed: () {
        ImagePickerHelper()
            .imagePickerFromCamera((filePath) => _processImage(filePath));
      },
      child: Text("From Camera"),
    );
  }
}