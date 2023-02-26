import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';
//defining state for BLoC
abstract class SearchState {}
//initial
class InitialSate extends SearchState {}
//loading state
class ResultLoadingState extends SearchState {}
//result loaded state
class ResultLoadedState extends SearchState {
  final ProductModel products;
  ResultLoadedState(this.products);
}
//no result state
class NoResultState extends SearchState {
  final String error;
  NoResultState(this.error);
}
//©Rakibul Islam
