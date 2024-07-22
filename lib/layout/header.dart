


import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/block/cart/cart_bloc.dart';
import 'package:flutter_jun/helpers/product.dart';
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
   final Function openModal;

  Header({super.key, required this.openModal});

 

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
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state){
                final countProducts=state.products.length;

                return CartBtnWidget(countProducts: countProducts, openModal: widget.openModal,);

              }),
            const SizedBox(width: 50),
            LoginBtnWidget()
       
            
            
         
       
           ],
         ),
       )
      ),
    );
  }
}

class Products {
}
