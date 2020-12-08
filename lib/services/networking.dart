import 'dart:convert';
import 'package:http/http.dart' as http;

class NetWorkHelper {
  NetWorkHelper({this.url});
  final String url;

  Future postData({dynamic body}) async {
    try {
      var response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: body);

      if (response.statusCode == 200) {
        String _data = utf8.decode(response.bodyBytes);
        return jsonDecode(_data);
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      print(e);
      return jsonDecode('{"result": 401}');
    }
  }

  Future getData({bool useTimeout}) async {
    try {
      bool _useTimeout = false;
      _useTimeout = useTimeout == null ? false : useTimeout;
      if (_useTimeout == false) {
        http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          String _data = utf8.decode(response.bodyBytes);
          return jsonDecode(_data);
        } else {
          print(response.statusCode);
        }
      } else {
        http.Response response = await http.get(url).timeout(Duration(seconds: 2));
        if (response.statusCode == 200) {
          String _data = utf8.decode(response.bodyBytes);
          print(_data);
          return jsonDecode(_data);
        } else {
          print(response.statusCode);
        }
      }
    } catch (e) {
      return e;
    }
  }
}
