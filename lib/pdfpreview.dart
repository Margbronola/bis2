// ignore_for_file: avoid_print

import 'dart:io';
import 'package:bis/exportpdf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatefulWidget {
  dynamic user;
  dynamic grade;
  PdfPreviewPage({super.key, required this.user, required this.grade});

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  Uint8List? pdfMeta;
  getPdfMeta() async {
    try {
      pdfMeta = await makePdf(widget.user, widget.grade);

      final tempDir = Platform.isAndroid
          ? await DownloadsPath.downloadsDirectory()
          : await getApplicationDocumentsDirectory();
      if (tempDir == null) {
        Fluttertoast.showToast(msg: "Impossible aux afficher les PDF");
        return;
      }
      File file = await File('${tempDir.path}/grade.pdf').create();
      print(file.path);
      await file.writeAsBytes(pdfMeta!);
      if (mounted) setState(() {});
    } catch (e) {
      print("SS : $e");
      Fluttertoast.showToast(msg: "Impossible aux afficher les PDF");
    }
  }

  @override
  void initState() {
    getPdfMeta();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pdfMeta == null
          ? const CircularProgressIndicator.adaptive()
          : PdfPreview(
              build: (context) => pdfMeta!,
            ),
    );
  }
}
