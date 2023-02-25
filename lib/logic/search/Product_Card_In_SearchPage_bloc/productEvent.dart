abstract class ProductEvent{}
//defining event for search icon pressed

//defining event for add icon pressed
class AddProductButton extends ProductEvent{
}
//defining event for previous page pressed
class ItemOnPressed extends ProductEvent{
  final String slug;
  ItemOnPressed(this.slug);
}