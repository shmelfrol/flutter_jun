import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/app.dart';
import 'package:flutter_jun/block/cart/cart_bloc.dart';
import 'package:flutter_jun/block/hit/hit_block.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final cartBloc = CartBloc();

@override
  void initState() {
    cartBloc.add(LoadCartEvent());
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider<HitBloc>(create: (context)=> HitBloc(),),
        BlocProvider<CartBloc>(create: (context)=> cartBloc,),
      ],
      child: App()
      );
}
}


