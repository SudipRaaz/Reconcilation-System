import 'package:csv/csv.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart'; // To check platform

class RechargeController {
  // Method to get file path (only used for non-web platforms)
  // Future<String> getFilePath() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return "${directory.path}/form_data.csv";
  // }

  // Method to write data to CSV (only used for non-web platforms)
  // Future<void> writeToCsv(List<List<String>> data) async {
  //   String filePath = await getFilePath();
  //   File file = File(filePath);

  //   if (!(await file.exists())) {
  //     await file.create();
  //   }

  //   String csvData = const ListToCsvConverter().convert(data);
  //   await file.writeAsString(csvData, mode: FileMode.append);
  // }

  // Method to download CSV file on web
  void downloadCsvWeb(String csvData) {
    final blob = html.Blob([csvData], 'text/csv');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'form_data.csv')
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  // Method to handle CSV download or saving based on platform
  Future<void> handleCsvDownload(List<List<String>> data) async {
    String csvData = const ListToCsvConverter().convert(data);
    if (kIsWeb) {
      downloadCsvWeb(csvData);
    }
    // used for non- web platform where file can be accessible
    // else {
    //   await writeToCsv(data);
    // }
  }
}
