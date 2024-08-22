import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mks_app/src/constant/icons.dart';
import 'package:mks_app/src/controller/pdfFileController.dart';
import 'package:mks_app/src/view/createDocScreen.dart';
import 'package:mks_app/src/widgets/customOptionButton.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import '../constant/textstyle.dart';
import '../constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<File> _pdfFiles = [];
  Future<void> _loadPdfFiles() async {
    List<File> pdfFiles = await PdfFileController().getPdfFiles();
    setState(() {
      _pdfFiles = pdfFiles;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPdfFiles();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          "Sewanne/Sewaro",
          style: primaryStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
                child: Image.asset(
              logo,
              fit: BoxFit.cover,
            )),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: lightGreen, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select Your Document Type",
                    style: primaryStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customOptionButton(application, "Application", context),
                      customOptionButton(condolence, "Condolence", context),
                      customOptionButton(notification, "Notification", context),
                    ],
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Files",
                  style: primaryStyle,
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _pdfFiles.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No PDF files found',
                          style: primaryStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () => _loadPdfFiles(),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            child: Text(
                              "Reload",
                              style: secondaryStyle,
                            ))
                      ],
                    )
                  : ListView.builder(
                      itemCount: _pdfFiles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _pdfFiles[_pdfFiles.length - index - 1]
                                .path
                                .split('/')
                                .last,
                            style: secondaryStyle,
                          ),
                          leading: CircleAvatar(
                            child: Text(_pdfFiles[_pdfFiles.length - index - 1]
                                .path
                                .split('/')
                                .last[0]
                                .toUpperCase()),
                          ),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert_rounded),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  height: 30,
                                  onTap: () {
                                    PdfFileController().deletePdfFile(_pdfFiles[
                                        _pdfFiles.length - index - 1]);
                                    setState(() {
                                      _pdfFiles.removeAt(
                                          _pdfFiles.length - index - 1);
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text("Delete"))
                            ],
                          ),
                          onTap: () async {
                            await OpenFile.open(
                                _pdfFiles[_pdfFiles.length - index - 1].path);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          backgroundColor: lightGreen,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateDocScreen(
                    appbartitle: "Create Document",
                    t: null,
                  ),
                ));
          },
          label: Text(
            "Create",
            style: primaryStyle,
          )),
    );
  }
}
