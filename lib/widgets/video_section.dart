import 'package:flutter/material.dart';


class VideoSection extends StatelessWidget {
  
  List videoList = [
    'introduction to flutter',
    'install flutter and setup',
    'setu environment',
    'creating first flutter app',
  ];

  VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context,index){
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0 ?  Color(0xFFEF4F51)
              :  Color(0xFFEF4F51).withOpacity(0.6),
              shape: BoxShape.circle
            ),
            child: Icon(Icons.play_arrow_rounded,
            color: Colors.white, size: 30 ,),
          ) ,
          title: Text(videoList[index]),
          subtitle: Text("20 min 50 sec"),
        );
      },
    );
  }
}