// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Services {
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      return await image.readAsBytes();
    } else {
      print('No image selected');
    }
  }

  showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
