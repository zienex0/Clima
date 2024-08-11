import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getData() async {
    try {
      final parsedUrl = Uri.parse(url);
      http.Response response = await http.get(parsedUrl);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
