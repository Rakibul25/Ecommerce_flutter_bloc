
import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_bloc/searchEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_bloc/searchState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class searchBloc extends Bloc<SearchEvent,SearchState>{

  //initializing bloc and then what will happen after every event.
  searchBloc() : super(InitialSate()){
    on<SearchIconPressed>((event, emit) => {
      if(event.query == ""){
        emit(NoResultState("Please Enter something."))
      }else{
        emit(ResultLoadingState()),
        fetchResult(event.query)
      }
    });

    on<NextButtonPressed>((event, emit) => {
      emit(ResultLoadingState()),
      fetchResult(event.nextLink)
    });

    on<PrevButtonPressed>((event, emit) => {
      emit(ResultLoadingState()),
      fetchResult(event.prevLink)
    });

  }

  FetchData fetchData = FetchData();

  void fetchResult(String name) async{
    try{
      ProductModel products = await fetchData.getProduct(name);
      emit(ResultLoadedState(products));
    }catch(ex){
      emit(NoResultState(ex.toString()));
    }
  }
}