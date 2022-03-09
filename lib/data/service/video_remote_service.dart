import 'package:goodnessapp/utils/singleton.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class VideoRemoteService {
  Future<String> ReadData() async {
    try {
      /*
      Map<String, String> _headers = {
        'Content-type': 'Text/Plain',
      };
     */
      var url = Uri.parse(Singleton.baseURL + "/data.json");
      var data = await http.get(url);
      return data.body;
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<dynamic> ReadVersion() async {
    try {
      var url = Uri.parse(Singleton.baseURL + "/version.json");
      var data = await http.get(url);
      return json.decode(data.body) as dynamic;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
