import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:goodnessapp/utils/singleton.dart';

class MailController {
  Future<String> SendMail(
      Map<String, Object> _data, Map<String, String> _headers) async {
    try {
      var url =
          Uri.parse(Singleton.baseURL_api + "/api/Admin/Company/SendMailPlain");

      print(url);

      //var response = await http.post(url);
      var response =
          await http.post(url, headers: _headers, body: jsonEncode(_data));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'A network error occurred';
      }
    } catch (e) {
      print(e);
      return "";
    }
  }
}
