part of 'inqus_json.dart';

class InqusFileJson implements InqusJsonOriginInterface {
  const InqusFileJson(this.file, {this.encoding = utf8});

  final File file;

  final Encoding encoding;

  @override
  Future<Map<String, dynamic>> getJsonMap() async {
    final data = await file.readAsString(encoding: encoding);
    if (data.isEmpty) {
      throw Exception('Empty file body');
    }
    return jsonDecode(data);
  }
}
