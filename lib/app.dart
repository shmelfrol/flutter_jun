import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/pages/home/HomePage.dart';
import 'package:flutter_jun/router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});
 

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
 final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        scrollBehavior: MaterialScrollBehavior().copyWith(
    dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
  ),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      // builder: (context, router) => router!,
      routerConfig: _appRouter.config(),
    );
  }
}