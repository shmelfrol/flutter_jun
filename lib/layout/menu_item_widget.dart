import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
 String title;
 String path;
 String currentRoute;
 PageRouteInfo<dynamic> route;
 Function setRoute;

  MenuItemWidget({
    super.key, 
    required this.title, 
    required this.route,
    required this.path,
    required this.currentRoute,
    required this.setRoute
    });



  @override
  Widget build(BuildContext context) {
    return  MenuItemButton(
        onPressed: () {
         setRoute(path);
         context.router.push(route);},
        //onHover: (value) => print(currentRoute),
        child: Text(
          title, style: TextStyle(
            fontWeight: currentRoute == path ? FontWeight.bold : FontWeight.normal
          ),
          
          ),
                );
  }
}