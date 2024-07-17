import 'package:flutter/material.dart';



class mobileTopBar extends StatelessWidget implements PreferredSizeWidget{
  GlobalKey<ScaffoldState> scaffoldKey;
   mobileTopBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        ),
      title:Image.asset("assets/images/logo.png"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.amber,



    );
  }

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}