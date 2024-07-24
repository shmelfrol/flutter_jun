import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CoverCard extends StatefulWidget {

   CoverCard({
    super.key,

  });

  @override
  State<CoverCard> createState() => _CoverCardState();
}

class _CoverCardState extends State<CoverCard> {
 late final PageController _controller;
 late int _selectedIndex;


List<Widget> fotoList=[
    SlideFotoWidget(color: Colors.green, img: "assets/images/tishort-1.jpg",),
    SlideFotoWidget(color: Colors.yellow, img: "assets/images/tishort-2.jpg",),
    SlideFotoWidget(color: Colors.blue, img: "assets/images/tishort-3.jpg",),
    SlideFotoWidget(color: Colors.brown, img: "assets/images/tishort-4.jpg",),
   
];
 @override
  void initState() {
    super.initState();
    
    _controller = PageController(
      
    );
    _selectedIndex=0;
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: PageView.builder(
            controller: _controller,
            itemCount: fotoList.length,
            itemBuilder: (context, index){
              return fotoList[index];
                
            }
          
            ),
        ),
        Center(child: Row(
          children: [
             IconButton(
              onPressed: (){
                print(_controller.page);
                _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
              }, 
              icon: const Icon(Icons.arrow_back)),
            const Expanded(child: SizedBox()),  
            IconButton(
              onPressed: (){
                print(_controller.page);
                 _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
              }, 
              icon: const Icon(Icons.arrow_forward)),
          ],
        ))
      ],
    );
  }
}

class SlideFotoWidget extends StatelessWidget {
  Color color;
  String img;
  SlideFotoWidget({
    super.key,
    required this.color,
    required this.img
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
        image: AssetImage(img),
        )
    ),
    );
  }
}
