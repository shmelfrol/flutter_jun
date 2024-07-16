import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jun/pages/catalog/CatalogPage.dart';
import 'package:flutter_jun/pages/home/HomePage.dart';
import 'package:flutter_jun/pages/layout/LayoutForPage.dart';
import 'package:flutter_jun/pages/selection/SelectionPage.dart';



// !!!!!!!!!!!!! ЭТОТ ФАЙЛ ГЕНЕРИРУЕТСЯ АВТОМАТИЧЕСКИ КОММАНДОЙ: flutter packages pub run build_runner build !!!!!!!!!!!!!!!!!!!!

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

 @override
 List<AutoRoute> get routes => [
 AutoRoute(page: LayoutForRoute.page, path: '/', children: [
 AutoRoute(page: SelectionRoute.page, path: 'selection'),
 AutoRoute(page: CatalogRoute.page, path: 'catalog'),
 AutoRoute(page: HomeRoute.page, path: 'home')



 ]),
 
 ];
}

