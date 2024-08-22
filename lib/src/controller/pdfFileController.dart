import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PdfFileController {
  Future<List<File>> getPdfFiles() async {
    final directory = await getExternalStorageDirectory();
    List<FileSystemEntity> files = directory!.listSync();
    List<File> pdfFiles = files
        .where((file) => file.path.endsWith('.pdf'))
        .map((file) => File(file.path))
        .toList();
    print(pdfFiles);
    return pdfFiles;
  }

  Future<void> deletePdfFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();

        print('${file.path} deleted successfully.');
      } else {
        print('File does not exist.');
      }
    } catch (e) {
      print('Error deleting file: $e');
    }
  }
}
