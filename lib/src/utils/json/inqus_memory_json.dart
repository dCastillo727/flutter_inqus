part of 'inqus_json.dart';

class InqusMemoryJson implements InqusJsonOriginInterface {
  const InqusMemoryJson(this.bytes, {this.encoder = utf8});

  final Uint8List bytes;

  final Encoding encoder;

  @override
  Future<Map<String, dynamic>> getJsonMap() {
    final data = encoder.decode(bytes);
    if (data.isEmpty) {
      throw Exception('Empty memory body');
    }
    return jsonDecode(data);
  }
}
