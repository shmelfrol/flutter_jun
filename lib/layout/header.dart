


import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/router/app_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cart_btn_widget.dart';
import 'header_menu.dart';
import 'lang_btn_widget.dart';
import 'languge_widget.dart';
import 'login_btn_widget.dart';
import 'logo_widget.dart';
import 'menu_item_widget.dart';
import 'search_widget.dart';

class Header extends StatefulWidget implements PreferredSizeWidget{
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _HeaderState extends State<Header> {

 final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
       height: 100,
      //  decoration: const BoxDecoration(
      //    color: Color.fromARGB(255, 172, 121, 121),
      //  ),
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Row(
           children: [
            LogoWidget(),
            const SizedBox(width: 50),
            HeaderMenu(),
            const SizedBox(width: 50),
            Flexible(child: SearchWidget(searchController: _searchController)),
            Expanded(child: const SizedBox(width: 50)),
            LangugeWidget(),
            CartBtnWidget(),
            const SizedBox(width: 50),
            LoginBtnWidget()
       
            
            
         
       
           ],
         ),
       )
      ),
    );
  }
}
