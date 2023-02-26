abstract class ProductEvent{}

//defining event for add icon pressed
class AddProductButton extends ProductEvent{
}
//if product card pressed
class ItemOnPressed extends ProductEvent{
  final String slug;
  ItemOnPressed(this.slug);
}