import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ProductPage extends StatefulWidget {
  final int id;


  const ProductPage({super.key, @PathParam('id') required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  @override
  Widget build(BuildContext context) {
    final id=widget.id;
    return  RefreshIndicator(
      onRefresh: ()async{print("object");},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
              Container(
                color: Colors.grey,
                height: 100,
              )
          ],
        ),
      ), 
      );
  }
}