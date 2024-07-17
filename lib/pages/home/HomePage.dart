import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/block/hit/hit_block.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final hitBloc = HitBloc()..add(LoadHitsEvent());
    var screenSize = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<HitBloc>(create: (context)=> hitBloc,)
      ],
      child: RefreshIndicator(
         onRefresh: () async {
            // Replace this delay with the code to be executed during refresh
            // and return a Future when code finishes execution.
            return Future<void>.delayed(const Duration(seconds: 3));
          },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SectionTitleWidget(title: 'Хиты продаж', buttonAction: (){print("смотреть всех");},),
                Container(
              height: screenSize.width < 900? screenSize.width*2/4: screenSize.width/3,
              color: Colors.white,
              child: BlocBuilder<HitBloc, HitState>(
                bloc: hitBloc,
                builder: (context, state){
                  final hits = state.hits;
                  if(hits.isNotEmpty) {
                    return StaggeredGrid.count(
                      crossAxisCount:screenSize.width < 900? 4:6,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children:  [
                        StrGridTile(crossAxisCellCount: screenSize.width < 900? 1:2, mainAxisCellCount: screenSize.width < 900? 1:2, index: 1, name: hits[0].name, rating: hits[0].rating, price: hits[0].price,),
                        StrGridTile(crossAxisCellCount: 1, mainAxisCellCount: 1, index: 2, name: hits[1].name, rating: hits[1].rating, price: hits[1].price,),
                        StrGridTile(crossAxisCellCount: 1, mainAxisCellCount: 1, index: 3, name: hits[2].name, rating: hits[2].rating, price: hits[2].price,),
                        StrGridTile(crossAxisCellCount: screenSize.width < 900? 1:2, mainAxisCellCount: 1, index: 4, name: hits[3].name, rating: hits[3].rating, price: hits[3].price,),
                        StrGridTile(crossAxisCellCount: 1, mainAxisCellCount: 1, index: 5, name: hits[4].name, rating: hits[4].rating, price: hits[4].price,),
                        StrGridTile(crossAxisCellCount: 1, mainAxisCellCount: 1, index: 6, name: hits[5].name, rating: hits[5].rating, price: hits[5].price,),
                        StrGridTile(crossAxisCellCount: 1, mainAxisCellCount: 1, index: 7, name: hits[6].name, rating: hits[6].rating, price: hits[6].price,),
                        StrGridTile(crossAxisCellCount: 1, mainAxisCellCount: 1, index: 8, name: hits[7].name, rating: hits[7].rating, price: hits[7].price,),
                      ],
        );
                  }
                    return Text("data!!!!!!!!!");
                }),
            ),
                 SectionTitleWidget(title: 'Хиты продаж', buttonAction: (){print("смотреть всех");},),
             Container(
              height: 300,
              color: Colors.yellow,
            ),
            Container(
              height: 300,
              color: Colors.brown,
            )
            ],
          ),
        ) 
        
        
    
    
      ),
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  String title;
  Function buttonAction;
  SectionTitleWidget({
    super.key,
    required this.title,
    required this.buttonAction
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        TextButton(onPressed: (){buttonAction();}, child: Text('смотреть все'))
      ],
    );
  }
}

class StrGridTile extends StatelessWidget {
  int crossAxisCellCount;
  int mainAxisCellCount;
  int index;
  double rating;
  String name;
  int price;


 StrGridTile({
    super.key,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.index,
    required this.rating,
    required this.name,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                    decoration: const BoxDecoration(
                      image:  DecorationImage(
                image: AssetImage("assets/images/product.png")
                ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingWidget(rating: rating,),
                      ],
                    ),
                                ),
                  ),
              Center(
                 child: FittedBox(
                  fit: BoxFit.fitWidth, 
                  child: Text(name, style: TextStyle(
                    fontSize: 18
                  ),)
                  )
               ),
               FittedBox(
                  fit: BoxFit.fitWidth, 
                  child: Text(price.toString(), style: TextStyle(
                    fontSize: 20
                  ),)
                  )
               
              ],
            ),
          )
          ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  double rating;
  RatingWidget({
    super.key,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child:  Padding(
        padding: EdgeInsets.all(1.0),
        child: 
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(children: [
          const Icon(Icons.star, size: 10,),
          FittedBox(
            fit: BoxFit.fitWidth,
            child:Text(rating.toString(), style: TextStyle(
              fontSize: 10
            ),)
          )
          
          ],),
        )
        
      ),
    );
  }
}


