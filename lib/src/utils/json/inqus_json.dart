import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_inqus/src/interfaces/json_origin_interface.dart';
import 'package:http/http.dart' as http;

part 'inqus_asset_json.dart';
part 'inqus_file_json.dart';
part 'inqus_memory_json.dart';
part 'inqus_network_json.dart';

class InqusJson {
  static InqusJsonOriginInterface asset(String path) {
    return InqusAssetJson(path);
  }

  static InqusJsonOriginInterface file(File file, {Encoding encoding = utf8}) {
    return InqusFileJson(file, encoding: encoding);
  }

  static InqusJsonOriginInterface memory(Uint8List bytes, {Encoding encoder = utf8}) {
    return InqusMemoryJson(bytes, encoder: encoder);
  }

  static InqusJsonOriginInterface network(String url, {Map<String, String>? headers}) {
    return InqusNetworkJson(url, headers: headers);
  }
}
