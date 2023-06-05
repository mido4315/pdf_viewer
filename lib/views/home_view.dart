
import 'package:flutter/material.dart';
import 'package:pdf_viewer/views/pdf_show_view.dart';
import 'package:provider/provider.dart';

import '../business_logic.dart';

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
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width *0.15,
              child: ElevatedButton(
                onPressed: () async {
                  bool check = await state.loadFile();
                  if(check){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfShowView(
                            pdfFile: state.file,
                          ),
                        ));
                  }
                },
                child: const Text(
                  "Open",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}