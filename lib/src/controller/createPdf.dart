import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

final pw.Document pdf = pw.Document();

Future<void> createPDF(String title, String date, String body,
    String personName, String personDesignation, bool addCopyTo) async {
  final logoImage = pw.MemoryImage(
      (await rootBundle.load("assets/letter_head.jpg")).buffer.asUint8List());
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            //Letter Head
            pw.SizedBox(child: pw.Image(logoImage)),
            pw.SizedBox(
              height: 30,
            ),
            pw.Text(
              title.toUpperCase(),
              style: pw.TextStyle(
                  font: pw.Font.times(),
                  fontSize: 18,
                  decoration: pw.TextDecoration.underline),
            ),
            pw.Text(
              "Dated : $date",
              style: pw.TextStyle(
                fontSize: 12,
                font: pw.Font.times(),
              ),
            ),
            pw.SizedBox(
              height: 30,
            ),
            pw.Container(
              // width: MediaQuery.of(context as BuildContext).size.width * 0.9,
              child: pw.Text(
                body,
                style: pw.TextStyle(
                  font: pw.Font.times(),
                  fontSize: 13,
                ),
                textAlign: pw.TextAlign.justify,
              ),
            ),
            pw.SizedBox(
              height: 30,
            ),
            pw.Text(
              "Thank You, Jai Kirat",
              style: pw.TextStyle(
                fontSize: 13,
                font: pw.Font.times(),
              ),
            ),
            pw.SizedBox(
              height: 40,
            ),
            pw.Container(
              // width: MediaQuery.of(context as BuildContext).size.width * 0.9,
              child: pw.Row(
                children: [
                  pw.Align(
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Container(
                        child: addCopyTo == true
                            ? pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Copy To:",
                                    style: pw.TextStyle(
                                      font: pw.Font.times(),
                                      fontSize: 13,
                                    ),
                                  ),
                                  pw.Text(
                                    "1) President for kind information",
                                    style: pw.TextStyle(
                                      font: pw.Font.times(),
                                      fontSize: 13,
                                    ),
                                  ),
                                  pw.Text(
                                    "2) Office file for record",
                                    style: pw.TextStyle(
                                      font: pw.Font.times(),
                                      fontSize: 13,
                                    ),
                                  ),
                                  pw.Text(
                                    "3) Person concern",
                                    style: pw.TextStyle(
                                      font: pw.Font.times(),
                                      fontSize: 13,
                                    ),
                                  ),
                                  pw.Text(
                                    "4) Social media for information",
                                    style: pw.TextStyle(
                                      font: pw.Font.times(),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              )
                            : pw.Container()),
                  ),
                  pw.Expanded(child: pw.Container()),
                  pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Container(
                      child: pw.Column(
                        children: [
                          pw.Text("$title issued by:-",
                              style: pw.TextStyle(
                                font: pw.Font.times(),
                              )),
                          pw.SizedBox(
                            height: 25,
                          ),
                          pw.Text(personName,
                              style: pw.TextStyle(
                                fontSize: 13,
                                font: pw.Font.times(),
                              )),
                          pw.Text("( $personDesignation )",
                              style: pw.TextStyle(
                                fontSize: 13,
                                font: pw.Font.times(),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    ),
  );

  final output = await getExternalStorageDirectory();
  final file = File(
      "${output!.path}/${title}_createdOn-${DateTime.now().toString()}.pdf");
  await file.writeAsBytes(await pdf.save());
  await OpenFile.open(file.path);
}
