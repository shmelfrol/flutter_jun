import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/block/hit/hit_block.dart';
import 'package:flutter_jun/pages/home/HomePage.dart';

class HitsWidget extends StatelessWidget {
  const HitsWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: screenSize.width < 900? screenSize.width*2/4: screenSize.width/3,
            color: Colors.white,
            child: BlocBuilder<HitBloc, HitState>(
    builder: (context, state){
      final hits = state.hits;
      if(hits.isNotEmpty) {
        return StrageredHitProducts(screenSize: screenSize, hits: hits);
      }
      if (state.isLoading == true) {
        return const Center(
          child: CircularProgressIndicator());
      }

        return Text("data!!!!!!!!!");
    }),
          );
  }
}
