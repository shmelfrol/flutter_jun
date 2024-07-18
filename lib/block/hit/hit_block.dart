

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/api/product_api.dart';


part 'hit_events.dart';
part 'hit_state.dart';


class HitBloc extends Bloc<HitEvent, HitState>{

  HitBloc():super(HitState()){
    on<LoadHitsEvent>(_loadHitsEvent);
  }

Future<void> _loadHitsEvent(
  LoadHitsEvent event,
  Emitter<HitState> emit
)async{


emit(state.copyWith(isLoading: true, hits: [],));
  String jsonHits=await ProductApi().getHits();

  final decoded = json.decode(jsonHits);
 
  List<Product> hits=[];
  for(final item in decoded){
    final Product p = Product.fromJson(item);  // создаем объект Person
    hits.add(p);
  }


 emit(state.copyWith(isLoading: false, hits: hits));

}
  
}