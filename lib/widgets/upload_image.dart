import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatelessWidget {
  final Function setImage;

  const UploadImage({
    Key key,
    @required this.setImage,
  }) : super(key: key);

  void getImageFile(ImageSource source, context) async {
    print(source);

    var image = await ImagePicker.pickImage(source: source);

    setImage(image, basename(image.path));
    Navigator.pop(context);
    print(image.uri);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () => getImageFile(ImageSource.camera, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.camera_alt,
                    ),
                    Text("Camera"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => getImageFile(ImageSource.gallery, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.file_upload,
                    ),
                    Text("Gallery"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
