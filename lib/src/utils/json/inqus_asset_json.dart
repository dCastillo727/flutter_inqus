part of 'inqus_json.dart';

class InqusAssetJson implements InqusJsonOriginInterface {
  const InqusAssetJson(this.path);

  final String path;

  @override
  Future<Map<String, dynamic>> getJsonMap() async {
    final data = await rootBundle.loadString(path);
    return jsonDecode(data);
  }
}
