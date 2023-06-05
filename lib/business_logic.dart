import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PdfProvider extends ChangeNotifier {
  File file = File('');
  static List<String> globalArgs = [''];

  Future<void> loadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path.toString());
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }


}