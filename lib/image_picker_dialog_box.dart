import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialogBox {
  static Future<File> showImagePicker(BuildContext context) {
    ImagePicker imagePicker = new ImagePicker();
    var imagePickerDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0.0,
        child: Container(
            padding: new EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    onTap: () async {
                      try {
                        PickedFile image = await imagePicker.getImage(source: ImageSource.camera);
                        if (image != null) {
                          Navigator.pop(context, File(image.path));
                        } else {
                          Navigator.of(context).pop();
                        }
                      } catch (e) {}
                    },
                    title: Text("Take Photo")),
                ListTile(
                    onTap: () async {
                      try {
                        File file = await FilePicker.getFile(
                          type: FileType.custom,
                          allowedExtensions: ['png', 'jpg'],
                        );
                        if (file != null) {
                          Navigator.pop(context, file);
                        } else {
                          Navigator.of(context).pop();
                        }
                      } catch (e) {}
                    },
                    title: Text("Choose from Gallery")),
                RaisedButton(
                  child: Text("close"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            )));

    return showDialog(
        useRootNavigator: false, context: context, builder: (context) => imagePickerDialog);
  }
}
