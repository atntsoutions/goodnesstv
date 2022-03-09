import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  LocalStorage() {}

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/${fileName}');
  }

  Future<bool> writeText(String fileName, String data) async {
    try {
      final file = await _localFile(fileName);
      file.writeAsString(data);
      return true;
    } catch (e) {
      print('Error ${e}');
      return false;
    }
  }

  Future<String> readText(String fileName) async {
    try {
      final file = await _localFile(fileName);
      // Read the file
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      print('Error ${e}');
      return '';
    }
  }
}
