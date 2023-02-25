import 'dart:async';

import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{

  ProductBloc() : super(InitialSate()){
    on<AddProductButton>((event, emit) => {
      emit(AddOptionState())
    });
    on<ItemOnPressed>((event, emit) => {
      //emit(ResultLoadingState()),
      fetchResultSingle(event.slug)
    });

  }
  FetchData fetchData = FetchData();

  void fetchResultSingle(String slug) async{
    try{
      IndividualProduct product = await fetchData.singleproduct(slug);
      emit(SingleDataLoadedState(product));
    }catch(ex){
      emit(NoResultState(ex.toString()));
    }
  }

}