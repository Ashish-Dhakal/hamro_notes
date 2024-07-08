import 'package:flutter/material.dart';
import 'course_list_screen.dart'; // Import the CourseList screen

class UniversityList extends StatelessWidget {
  final List<String> universityNames = [
    "Harvard University",
    "Stanford University",
    "MIT",
    "University of Cambridge",
    "University of Oxford",
    // Add more universities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("University List"),
        backgroundColor: Colors.pink[100],
      ),
      body: ListView.builder(
        itemCount: universityNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(universityNames[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseList(universityNames[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
