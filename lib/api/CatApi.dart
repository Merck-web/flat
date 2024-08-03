import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CatApi {

  CatApi({ this.url = 'https://api.thecatapi.com/v1/images/search', this.count = 5 });

  final String url;
  final int count;

  Future<dynamic> getCatData() async {
    http.Response response;
    final apiKey = dotenv.env['CAT_KEY'] ?? "";

    String targetUrl = url + '?limit=$count';

    response = await http.get(Uri.parse(targetUrl), headers: {
      'x-api-key': apiKey ?? '',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    }
    else {
      print(response.statusCode);
      return null;
    }

  }
}

