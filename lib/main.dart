import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_viewer/business_logic.dart';
import 'package:pdf_viewer/views/pdf_show_view.dart';
import 'package:provider/provider.dart';

import 'views/home_view.dart';


void main(List<String> args) {

  // final List<String> myArgs = [
  //   'string 01',
  //   'string 02',
  //   'string 03',
  // ];
  //args = myArgs;
  if (args.isNotEmpty) {
    PdfProvider.globalArgs = args;
  }

  //print("${globalArgs[0]} a777777777777a");
  runApp(
    ChangeNotifierProvider(
      create: (context) => PdfProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDF Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PdfProvider.globalArgs[0] == ''
          ? const HomeView()
          : PdfShowView(
              pdfFile: File(
                PdfProvider.globalArgs[0],
              ),
            ),
    );
  }
}