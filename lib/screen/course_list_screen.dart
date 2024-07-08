import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'pdf_viewer_screen.dart'; // Import the PDFViewerScreen

class CourseList extends StatelessWidget {
  final String universityName;

  CourseList(this.universityName);

  final Map<String, List<Map<String, String>>> universityCourses = {
    "Harvard University": [
      {"name": "Course 1", "file": "harvard_course1.pdf"},
      {"name": "Course 2", "file": "harvard_course2.pdf"},
      {"name": "Course 3", "file": "harvard_course3.pdf"}
    ],
    "Stanford University": [
      {"name": "Course A", "file": "stanford_courseA.pdf"},
      {"name": "Course B", "file": "stanford_courseB.pdf"},
      {"name": "Course C", "file": "stanford_courseC.pdf"}
    ],
    "MIT": [
      {"name": "Course X", "file": "mit_courseX.pdf"},
      {"name": "Course Y", "file": "mit_courseY.pdf"},
      {"name": "Course Z", "file": "mit_courseZ.pdf"}
    ],
    "University of Cambridge": [
      {"name": "Course Alpha", "file": "cambridge_course_alpha.pdf"},
      {"name": "Course Beta", "file": "cambridge_course_beta.pdf"},
      {"name": "Course Gamma", "file": "cambridge_course_gamma.pdf"}
    ],
    "University of Oxford": [
      {"name": "Course 101", "file": "oxford_course101.pdf"},
      {"name": "Course 102", "file": "oxford_course102.pdf"},
      {"name": "Course 103", "file": "oxford_course103.pdf"}
    ],
    // Add more universities and their courses as needed
  };

  Future<String> _loadPdfFromAsset(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    if (!await file.exists()) {
      final data = await rootBundle.load('assets/$fileName');
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes);
    }

    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> courses = universityCourses[universityName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("$universityName Courses"),
        backgroundColor: Colors.pink[100],
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index]['name']!),
            onTap: () async {
              String path = await _loadPdfFromAsset(courses[index]['file']!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerScreen(path),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


