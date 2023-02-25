import 'dart:async';

import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{

  ProductBloc() : super(InitialSate()){
    on<AddProductButton>((event, emit) => {
      emit(AddOptionState())
    });

  }

}