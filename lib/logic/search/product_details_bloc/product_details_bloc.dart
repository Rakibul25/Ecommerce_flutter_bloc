import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_state.dart';

import 'product_details_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc extends Bloc<DetailsEvent,DetailsState>{

  //initializing bloc and then what will happen after every event.
  ProductDetailsBloc() : super(InitialState()){
    on<EventWithQuantity>((event, emit) => {
      fetchResultforwithquantity(event.slug)
    });
    on<EventWithoutQuantity>((event, emit) => {
      fetchResultforwithoutquantity(event.slug)
    });
  }

  FetchData fetchData = FetchData();

  void fetchResultforwithoutquantity(String slug) async{
    try{
      IndividualProduct individualProduct = await fetchData.singleproduct(slug);
      print(individualProduct.data.description.toString());
      emit(ProductWithoutQuantity(individualProduct));
    }catch(ex){
      emit(NoResultState(ex.toString()));
    }
  }
  void fetchResultforwithquantity(String slug) async{
    try{
      IndividualProduct individualProduct = await fetchData.singleproduct(slug);
      emit(ProductWithQuantity(individualProduct));
    }catch(ex){
      emit(NoResultState(ex.toString()));
    }
  }
}