abstract class SearchEvent{}
//defining event for search icon pressed
class SearchIconPressed extends SearchEvent{
  final String query;
  SearchIconPressed(this.query);
}
//defining event for next page pressed
class NextButtonPressed extends SearchEvent{
  final String nextLink;
  NextButtonPressed(this.nextLink);
}
//defining event for previous page pressed
class PrevButtonPressed extends SearchEvent{
  final String prevLink;
  PrevButtonPressed(this.prevLink);
}
//defining event for add icon pressed
class AddProductButton extends SearchEvent{

}