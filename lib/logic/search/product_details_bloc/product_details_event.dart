abstract class DetailsEvent{}
//defining event for search icon pressed
class EventWithoutQuantity extends DetailsEvent{
  final String slug;
  EventWithoutQuantity(this.slug);
}
//defining event for next page pressed
class EventWithQuantity extends DetailsEvent{
  final String slug;
  EventWithQuantity(this.slug);
}