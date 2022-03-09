import 'dart:convert';
import 'package:goodnessapp/utils/local_storage.dart';

class VideoLocalService {
  LocalStorage _localStorage = new LocalStorage();
  final filedata = "data";
  final fileversion = "version";

  Future<List<dynamic>> ReadData(String _type) async {
    try {
      var data = await _localStorage.readText(filedata);
      return jsonDecode(data) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> ReadVersion(String _type) async {
    try {
      final data = await _localStorage.readText(fileversion);
      if (data == "") return 0;
      int iData = int.parse(data.toString());
      return iData;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<bool> SaveVersion(int version) async {
    try {
      await _localStorage.writeText(fileversion, version.toString());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> SaveData(String json) async {
    try {
      await _localStorage.writeText(filedata, json);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
