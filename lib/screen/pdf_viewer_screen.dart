import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfPath;

  PDFViewerScreen(this.pdfPath);

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool _isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
        backgroundColor: Colors.pink[100],
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.pdfPath,
            autoSpacing: false,
            swipeHorizontal: false,
            pageSnap: false,
            onRender: (pages) {
              setState(() {
                _totalPages = pages!;
                _isReady = true;
              });
            },
            onViewCreated: (PDFViewController pdfViewController) {
              pdfViewController.setPage(_currentPage);
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
                _currentPage = page!;
              });
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onError: (error) {
              print(error.toString());
            },
          ),
          if (!_isReady)
            Center(
              child: CircularProgressIndicator(),
            ),
          if (_isReady)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.black.withOpacity(0.7),
                child: Text(
                  'Page ${_currentPage + 1} of $_totalPages',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
