import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer/views/pdf_show_view.dart';
import 'package:provider/provider.dart';

import '../business_logic.dart';
import '../main.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PdfProvider>(
        builder: (context, state, child) {
          return Center(
            child: ElevatedButton(
              onPressed: () async {
                await state.loadFile();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfShowView(
                        pdfFile: state.file,
                      ),
                    ));
              },
              child: const Text(
                "Open",
              ),
            ),
          );
        },
      ),
    );
  }
}