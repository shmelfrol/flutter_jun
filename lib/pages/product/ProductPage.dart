import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cover_card.dart';


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
    var screenSize = MediaQuery.of(context).size;
    final id=widget.id;
    return  RefreshIndicator(
      onRefresh: ()async{print("object");},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
                ProductPageTitleWidget(),
                const SizedBox(height: 10,),
                Container(
                  color: Colors.orange,
                  height: screenSize.width/3,
                  child: Row(children: [
                    Container(
                      width: 19*screenSize.width/30,
                      decoration: BoxDecoration(
                       color: Colors.transparent, 
                       borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: CoverCard(),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      width: 10*screenSize.width/30,
                      color: Colors.deepPurple
                    )
                  ]),
                ),
                const SizedBox(height: 10,),
                Container(
                  color: Colors.blueGrey,
                  height: 200,
                )
            ],
          ),
        ),
      ), 
      );
  }
}


class ProductPageTitleWidget extends StatelessWidget {
  const ProductPageTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5)
      ),
      child:  const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/product.png"),
              width: 100,
              height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children :[
                  Text('Product', style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold
                  ),),
                  Text('Категория')
                ]
              ),
              Expanded(child: SizedBox()),
              productPageButton(titleBtn: 'Добавить в избранное',),
              SizedBox(width: 20,),
              productPageButton(titleBtn: 'Купить',),
                
             
          ],
        ),
      ),
    );
  }
}

class productPageButton extends StatelessWidget {
  final String titleBtn;
  const productPageButton({
    required this.titleBtn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(titleBtn, style: const TextStyle(color: Colors.white),),
          ),
          );
  }
}