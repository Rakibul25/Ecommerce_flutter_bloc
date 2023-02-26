//©Rakibul Islam
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';

abstract class ProductState {}
//initial
class InitialSate extends ProductState {}
//if added to cart
class AddOptionState extends ProductState{
}
//if data loaded
class SingleDataLoadedState extends ProductState {
  final IndividualProduct product;
  SingleDataLoadedState(this.product);
}
//if no data
class NoResultState extends ProductState {
  final String error;
  NoResultState(this.error);
}