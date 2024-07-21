part of 'cart_bloc.dart';



abstract class CartEvent {}


class LoadCartEvent extends CartEvent{

  
}


class AddOneProductEvent extends CartEvent{
    final Product product;
    AddOneProductEvent({
      required this.product
    });
}
