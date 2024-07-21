import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jun/pages/catalog/CatalogPage.dart';
import 'package:flutter_jun/pages/home/HomePage.dart';
import 'package:flutter_jun/pages/layout/LayoutForPage.dart';
import 'package:flutter_jun/pages/product/ProductPage.dart';
import 'package:flutter_jun/pages/selection/SelectionPage.dart';



// !!!!!!!!!!!!! ЭТОТ ФАЙЛ ГЕНЕРИРУЕТСЯ АВТОМАТИЧЕСКИ КОММАНДОЙ: dart run build_runner build !!!!!!!!!!!!!!!!!!!!

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
   @override
  RouteType get defaultRouteType => const RouteType.adaptive();

 @override
 List<AutoRoute> get routes => [
 AutoRoute(
  page: LayoutForRoute.page, 
  path: '/', 
  initial: true,
  children: [
    AutoRoute(page: HomeRoute.page, path: ''),
    // AutoRoute(page: SelectionRoute.page, path: ''),
    AutoRoute(page: SelectionRoute.page, path: 'selection'),
    AutoRoute(page: CatalogRoute.page, path: 'catalog'),
    AutoRoute(page: ProductRoute.page, path: 'products/view/:id')
 ]
 ),
 
 ];
}

