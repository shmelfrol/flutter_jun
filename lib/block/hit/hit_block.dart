

import 'package:flutter_bloc/flutter_bloc.dart';


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
  final List<Product> hits=[
    Product(id: 1, name: "product 1", hit: true, novetly: false, price: 10, rating: 4.5 ),
    Product(id: 2, name: "product 2", hit: true, novetly: false, price: 20, rating: 3.5 ),
    Product(id: 3, name: "product 3", hit: true, novetly: false, price: 30, rating: 6.5  ),
    Product(id: 4, name: "product 4", hit: true, novetly: false, price: 40, rating: 8.5  ),
    Product(id: 5, name: "product 5", hit: true, novetly: false, price: 50, rating: 9.5  ),
    Product(id: 6, name: "product 6", hit: true, novetly: false, price: 60, rating: 4.5  ),
    Product(id: 7, name: "product 1", hit: true, novetly: false, price: 70, rating: 0.5  ),
    Product(id: 8, name: "product 1", hit: true, novetly: false, price: 80, rating: 4.5  ),
  ];

 emit(state.copyWith(isLoading: false, hits: hits));

}
  
}