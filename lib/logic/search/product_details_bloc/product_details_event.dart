abstract class DetailsEvent{}
//event with quantity, this slug inside it will help to fetch data
class EventWithoutQuantity extends DetailsEvent{
  final String slug;
  EventWithoutQuantity(this.slug);
}
//event without quantity, this slug inside it will help to fetch data
class EventWithQuantity extends DetailsEvent{
  final String slug;
  EventWithQuantity(this.slug);
}