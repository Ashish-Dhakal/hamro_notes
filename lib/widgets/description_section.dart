import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child :Column(children: [
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enit.",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.6),
        ),
        textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Text("Course Length :" , 
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),),
            
            Icon(Icons.timer,
            color:  Color(0xFFEF4F51),
            ),
             SizedBox(width: 5),
             Text("26 hours",
             style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
             ),
             ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star,
            color: Colors.amber,),
            SizedBox(width: 5),
            Text("4.5",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),)
          ],
        )
         
      ],),
    );
  }
}