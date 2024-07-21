import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/router/app_router.dart';


class MobileMenu extends StatelessWidget {
  const MobileMenu({
    super.key,
  });

 @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              MobileMenuItem(title: "Главная", route: MainRoute(),),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                ),
              ),
              MobileMenuItem(title: "Каталог", route: const CatalogRoute(),),
              MobileMenuItem(title: "Подборка", route: const SelectionRoute(),),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2020 | Santos Enoque',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileMenuItem extends StatelessWidget {
  String title;
  PageRouteInfo<dynamic> route;
  MobileMenuItem({
    super.key,
    required this.route,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {context.router.push(route);},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}