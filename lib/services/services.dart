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

  void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  String dateFormatter(String dateTime) {
    //return DateFormat.yMMMd().format(dateTime.toDate()),
    return '9 Apr 2023';
  }
}
