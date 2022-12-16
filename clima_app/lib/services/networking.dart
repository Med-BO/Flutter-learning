import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String? url;

  NetworkHelper(this.url);

  Future getData() async {
    var client = http.Client();
    var response =
        await client.get(Uri.https('api.openweathermap.org', url ?? ''));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);
    return decodedResponse;
  }
}
