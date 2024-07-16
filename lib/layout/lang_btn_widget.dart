import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LangBtnWidget extends StatelessWidget {
 Function setLang;
 String lang;
String stateLang;

 LangBtnWidget({super.key, 
  required this.setLang, 
  required this.lang,
  required this.stateLang
  
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){setLang(lang);}, 
        child: Text(lang,
        style: TextStyle(
          color: Colors.black,
          fontWeight: stateLang == lang ? FontWeight.bold : FontWeight.normal
        )));
  }
}
