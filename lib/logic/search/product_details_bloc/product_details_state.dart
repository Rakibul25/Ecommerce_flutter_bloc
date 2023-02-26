import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';
//©Rakibul Islam
//defining state for BLoC
abstract class DetailsState {}
//initial
class InitialState extends DetailsState {
}

//if the quantity is generated or not added in cart
class ProductWithoutQuantity extends DetailsState {
  final IndividualProduct individualProduct;
  ProductWithoutQuantity(this.individualProduct);
}
//if the product added in cart and generate quantity number
class ProductWithQuantity extends DetailsState {
  final IndividualProduct individualProduct;
  ProductWithQuantity(this.individualProduct);
}

//no result
class NoResultState extends DetailsState {
  final String error;
  NoResultState(this.error);
}

