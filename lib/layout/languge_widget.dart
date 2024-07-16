import 'package:flutter/cupertino.dart';
import 'package:flutter_jun/layout/header.dart';
import 'package:flutter_jun/layout/lang_btn_widget.dart';

class LangugeWidget extends StatefulWidget {
  const LangugeWidget({
    super.key,
  });

  @override
  State<LangugeWidget> createState() => _LangugeWidgetState();
}

class _LangugeWidgetState extends State<LangugeWidget> {


 late String _lang;

 @override
  void initState() {
    _lang = 'RU';
    super.initState();
    
  }

void setLang(lang){
 setState(() {
   _lang=lang;
 });
}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LangBtnWidget(setLang: setLang, lang: 'RU', stateLang: _lang),
        const Text("|"),
        LangBtnWidget(setLang: setLang, lang: 'EN', stateLang: _lang)
      ],
    );
  }
}