import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/block/cart/cart_bloc.dart';
import 'package:flutter_jun/helpers/product.dart';

@RoutePage()
class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
    child: BlocBuilder<CartBloc, CartState>(
      builder:(context, state){
        return TextButton(
          onPressed: (){
            print("add to cart");
            context.read<CartBloc>().add(
              //LoadCartEvent()
              AddOneProductEvent(product: Product(id: 1, name: "name", hit: false, novetly: false, price: 50, rating: 0.0))
              );
            }, 
          child: Text(state.products.length.toString()));  
                  }),
    );
  }
}