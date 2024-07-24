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
              print(index);
              if(index!=_selectedIndex){
                return fotoList[_selectedIndex];
              }
              return fotoList[index];
                
            }
          
            ),
        ),
        Center(child: Row(
          children: [
             IconButton(
              onPressed: (){
                print(_controller.page);
                setState(() {
                  if(_selectedIndex>0) {
                    _selectedIndex=_selectedIndex-1;
                  }
                });
                 print(_selectedIndex);
              }, 
              icon: const Icon(Icons.arrow_back)),
            const Expanded(child: SizedBox()),  
            IconButton(
              onPressed: (){
                print(_controller.page);
                setState(() {
                  if(_selectedIndex<(fotoList.length-1)) {
                    _selectedIndex=_selectedIndex+1;
                  }
                });
                print(_selectedIndex);
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
      image: DecorationImage(
        image: AssetImage(img),
        )
    ),
    );
  }
}
