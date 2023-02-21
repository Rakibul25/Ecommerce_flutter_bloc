
import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_cubit/searchState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class searchCubit extends Cubit<searchState>{

  searchCubit() : super(ResultLoadingState()){
    fetchResult();
  }

  FetchData fetchData = FetchData();

  void fetchResult() async{
    try{
      List<Result> results = await fetchData.getProduct();
      emit(ResultLoadedState(results));
    }catch(ex){
      emit(NoResultState(ex.toString()));
    }
  }
}