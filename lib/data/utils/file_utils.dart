import 'package:flutter/services.dart' show rootBundle;

class FileUtils {
  FileUtils._();

  static const jsonFileBasePath = 'assets/raw/';

  static Future<String> readJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
