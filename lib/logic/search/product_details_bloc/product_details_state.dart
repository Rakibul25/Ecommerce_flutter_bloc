import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/data/model/productModel.dart';
//defining state for BLoC
abstract class DetailsState {}

class InitialState extends DetailsState {
}


class ProductWithoutQuantity extends DetailsState {
  final IndividualProduct individualProduct;
  ProductWithoutQuantity(this.individualProduct);
}

class ProductWithQuantity extends DetailsState {
  final IndividualProduct individualProduct;
  ProductWithQuantity(this.individualProduct);
}

class NoResultState extends DetailsState {
  final String error;
  NoResultState(this.error);
}

