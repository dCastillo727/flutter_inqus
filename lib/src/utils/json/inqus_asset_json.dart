part of 'inqus_json.dart';

class InqusAssetJson implements InqusJsonOriginInterface {
  const InqusAssetJson(this.path);

  final String path;

  @override
  Future<String> getJson() async {
    final data = await rootBundle.loadString(path);
    return jsonEncode(jsonDecode(data));
  }
}
