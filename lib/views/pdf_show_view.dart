import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfShowView extends StatefulWidget {
  const PdfShowView({super.key, required this.pdfFile});

  final File pdfFile;

  @override
  State<PdfShowView> createState() => _PdfShowViewState();
}

class _PdfShowViewState extends State<PdfShowView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PdfViewerController pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    String fileName = (widget.pdfFile.path.split('\\').last).split('.').first;
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.black,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.file(
        enableDoubleTapZooming: true,
        canShowHyperlinkDialog: true,
        controller: pdfViewerController,
        widget.pdfFile,
        key: _pdfViewerKey,
      ),
    );
  }
}