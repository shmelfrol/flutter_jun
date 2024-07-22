
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/block/cart/cart_bloc.dart';
import 'package:flutter_jun/helpers/product.dart';
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
  late bool modal;

  @override
  void initState() {
    setState(() {
      modal=false;
    });
    super.initState();
  }

  void openModal(){
      setState(() {
      
      modal=modal? false: true;

    });
  }
 
 
  @override
  Widget build(BuildContext context) {
 var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
     appBar: ResponsiveWidget.isSmallScreen(context)? mobileTopBar(scaffoldKey: scaffoldKey): AppBar(
      title:Header(openModal: openModal,),
      backgroundColor: Colors.amber,
      ),
      drawer: const MobileMenu(),
      body:  Center(
        child: Stack(
          children: [
            AutoRouter(),
            if(modal)ModalCartWidget(screenSize: screenSize)
          ],
        ),
      ),





    );
  }
}

class ModalCartWidget extends StatelessWidget {
  const ModalCartWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 2*screenSize.width/3,
        height: 2*screenSize.height/3,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 123, 132, 139),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Text("Корзина", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Container(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if(state.products.isNotEmpty){
                           List<Product>productsInCart= state.products;
                           int count=0;
                           List<CartPosition> cartPositions=[];
                           productsInCart.forEach((e){
                            bool sovpadenie=false;
                             if(cartPositions.isNotEmpty){

                              cartPositions.forEach((element) {
                                if(e.id == element.product.id) {
                                  element.count++;
                                  sovpadenie=true;
                                }
                              });  
                              if(!sovpadenie){
                                cartPositions.add(CartPosition(product: e, count: 1));
                              }
                             }else{
                              cartPositions.add(CartPosition(product: e, count: 1));
                             }
                           });


                         return ListView(
                          children: cartPositions.map((e) {
                            
                            return CartProductWidget(name: e.product.name, price: e.product.price, count: e.count);}
                          ).toList(),
                         );  
                      }else return Text('Cart is empty');
                    },
                  ),
                )
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("ИТОГО"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartProductWidget extends StatelessWidget {
  final String name;
  final int price;
  final int count;


  const CartProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.count
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Image(
                image: AssetImage("assets/images/product.png"),
                width: 50,
                height: 50,
                ),
              Text(name),
              SizedBox(width: 10,),
              Text("цена: ${price.toString()}"),
               SizedBox(width: 10,),
              Text("количество: ${count.toString()}")
            ],
          ),
        ),
      ),
    );
  }
}