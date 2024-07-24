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
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.orange),
    Container(color: Colors.red)
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
                  if(_selectedIndex<0)
                  _selectedIndex=_selectedIndex-1;
                });
              }, 
              icon: Icon(Icons.arrow_back)),
            const Expanded(child: SizedBox()),  
            IconButton(
              onPressed: (){
                print(_controller.page);
                setState(() {
                  if(_selectedIndex<(fotoList.length-1))
                  _selectedIndex=_selectedIndex+1;
                });
              }, 
              icon: Icon(Icons.arrow_forward)),
          ],
        ))
      ],
    );
  }
}
