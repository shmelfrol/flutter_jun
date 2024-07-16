


import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/router/app_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

 final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 100,
     decoration: BoxDecoration(
       color: const Color.fromARGB(255, 255, 255, 255),
     ),
     child: Row(
       children: [
        Container(
         width: 40,
         height: 40,
         decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12)
         ),
        ),
        MenuItem(title: "Каталог", route: const CatalogRoute()),
        MenuItem(title: "Подборка", route: const SelectionRoute()),
        SearchWidget(searchController: _searchController),
        LangugeWidget(),
        CartBtnWidget()

        
        
     

       ],
     )
    );
  }
}

class CartBtnWidget extends StatelessWidget {
  const CartBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: const Icon(
            CupertinoIcons.cart,
            color: Colors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ), 
            onPressed: () { print("Pressed"); }),
            Positioned(
              left:25,
              bottom: 21,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child:  Center(
                  child: const Text(
                    '10',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 8, 
                  ),),
                ),
                
              ),
            )
        ],
      ),
    );
  }
}

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
          fontWeight: stateLang == lang ? FontWeight.bold : FontWeight.normal
        )));
  }
}


class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      child: TextField(
        textAlign: TextAlign.start,
       controller: _searchController,
       decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform the search here
            },
          ),
          
          
      

       ),


      ),);
  }
}



class MenuItem extends StatelessWidget {
  String title;
 PageRouteInfo<dynamic> route;

  MenuItem({
    super.key, 
    required this.title, 
    required this.route,
    });

  @override
  Widget build(BuildContext context) {
    return  MenuItemButton(
        onPressed: () => context.router.push(route),
        child: Text(title),
                );
  }
}