import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';

abstract class searchState {}

class ResultLoadingState extends searchState{}

class ResultLoadedState extends searchState{
  final List<Result> result;
  ResultLoadedState(this.result);
}

class NoResultState extends searchState{
  final String error;
  NoResultState(this.error);
}

