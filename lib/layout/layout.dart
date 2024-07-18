
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/helpers/responsive.dart';
import 'package:flutter_jun/layout/header.dart';
import 'package:flutter_jun/layout/mobileTopBar.dart';
import 'package:flutter_jun/layout/mobile_navbar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


 
  @override
  Widget build(BuildContext context) {
 var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
     appBar: ResponsiveWidget.isSmallScreen(context)? mobileTopBar(scaffoldKey: scaffoldKey): AppBar(
      title:const Header(),
      backgroundColor: Colors.amber,
      ),
      drawer: const MobileMenu(),
      body: const Center(
        child: AutoRouter(),
      ),





    );
  }
}