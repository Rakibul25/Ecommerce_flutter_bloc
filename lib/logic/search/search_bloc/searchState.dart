import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';

abstract class SearchState {}

class InitialSate extends SearchState {}

class ResultLoadingState extends SearchState {}

class ResultLoadedState extends SearchState {
  final ProductModel products;
  ResultLoadedState(this.products);
}

class NoResultState extends SearchState {
  final String error;
  NoResultState(this.error);
}
