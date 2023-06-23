import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/shared/constants/http_constants.dart';
import 'package:path/path.dart';

abstract class UploadService {
  static Future<String> httpPostImage(File file) async {
    var uri = Uri.parse("$kUploadServiceUrl/image");

    var fileExtension = extension(file.path).replaceFirst(".", "");
    var response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: "image/$fileExtension",
      },
      body: file.readAsBytesSync(),
    );

    var imageUrl = response.body.toString();
    return imageUrl;
  }
}
