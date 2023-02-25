//defining state for BLoC
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';

abstract class ProductState {}

class InitialSate extends ProductState {}

class AddOptionState extends ProductState{
}
class SingleDataLoadedState extends ProductState {
  final IndividualProduct product;
  SingleDataLoadedState(this.product);
}
class NoResultState extends ProductState {
  final String error;
  NoResultState(this.error);
}