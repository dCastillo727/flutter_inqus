part of 'inqus_json.dart';

class InqusNetworkJson implements InqusJsonOriginInterface {
  const InqusNetworkJson(this.url, {this.headers});

  final String url;

  final Map<String, String>? headers;

  @override
  Future<Map<String, dynamic>> getJsonMap() async {
    final uri = Uri.tryParse(url);
    assert(uri != null, 'Invalid URL: $url');

    final response = await http.get(uri!, headers: headers);

    if (response.body.isEmpty) {
      throw Exception('Empty response body');
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load JSON: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
