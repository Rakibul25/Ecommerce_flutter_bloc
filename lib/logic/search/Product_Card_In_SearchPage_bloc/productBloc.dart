import 'dart:async';

import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  final _textController = StreamController<String>();

  Stream<String> get textStream => _textController.stream;
  ProductBloc() : super(InitialSate()){
    on<AddProductButton>((event, emit) => {
      emit(AddOptionState())
    });
    on<AddProduct>((event, emit) => {
      
    });
    on<RemoveProduct>((event, emit) => {

    });
  }

  int increment(int i){
    i++;
    return i;
  }
  int decrement(int i){
    i--;
    return i;
  }
}