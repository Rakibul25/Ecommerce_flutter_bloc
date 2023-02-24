abstract class ProductEvent{}
//defining event for search icon pressed

//defining event for add icon pressed
class AddProductButton extends ProductEvent{
}

class AddProduct extends ProductEvent{
  final int count;
  AddProduct(this.count);
}

class RemoveProduct extends ProductEvent{
  final int count;
  RemoveProduct(this.count);
}