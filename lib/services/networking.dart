import 'dart:convert';
import 'package:http/http.dart' as http;

class NetWorkHelper {
  NetWorkHelper({this.url});
  final String url;

  Future postData({Map<String, dynamic> body}) async {
    try {
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        String _data = response.body;
        return jsonDecode(_data);
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      return e;
    }
  }

  Future getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String _data = response.body;
        return jsonDecode(_data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      return e;
    }
  }
}
