//defining state for BLoC
abstract class ProductState {}

class InitialSate extends ProductState {}

class AddOptionState extends ProductState{
}

class ProductAddedState extends ProductState{
  final int numberOfProduct;
  ProductAddedState(this.numberOfProduct);
}
class ProductRemoveState extends ProductState{
  final int numberOfProduct;
  ProductRemoveState(this.numberOfProduct);
}