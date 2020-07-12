import 'dart:io';

import 'package:app_people/image_picker_dialog_box.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  static const String route = '/imageScreen';

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<ImageScreen> {
  File _toBeDisplayed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Screen"),
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              child: Text("Upload Image"),
              onPressed: () async {
                File file = await ImagePickerDialogBox.showImagePicker(context);
                setState(() {
                  _toBeDisplayed = file;
                });
              },
            ),
          ),
          _toBeDisplayed == null
              ? Container()
              : Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(
                    _toBeDisplayed,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
