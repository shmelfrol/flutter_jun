import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jun/layout/menu_item_widget.dart';
import 'package:flutter_jun/router/app_router.dart';

class MenuItem {
String title;
String path;
PageRouteInfo route;


MenuItem({required this.title, required this.route, required this.path});

}

var menuItemList =[
MenuItem(title: "Каталог", route: const CatalogRoute(), path: '/catalog'), 
MenuItem(title: "Подборка", route: const SelectionRoute(), path: '/selection'), 
];


class HeaderMenu extends StatefulWidget {
  const HeaderMenu({
    super.key,
  });

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
late String currentRoute;

@override
  void initState() {
    currentRoute=context.router.currentPath;
  }

 void setCurrentRoute (path){
    setState(() {
      currentRoute=path;
    });
  }



  @override
  Widget build(BuildContext context) {
    //String currentRoute = context.router.currentPath;
    return Row(
      children: menuItemList.map<MenuItemWidget>((e) => MenuItemWidget(
        title: e.title, 
        route: e.route, 
        path: e.path, 
        currentRoute: currentRoute, 
        setRoute: setCurrentRoute
      
        )).toList()
    );
  }
}

