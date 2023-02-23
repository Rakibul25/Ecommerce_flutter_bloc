abstract class SearchEvent{

}


class SearchIconPressed extends SearchEvent{
  final String query;
  SearchIconPressed(this.query);
}

class NextButtonPressed extends SearchEvent{
  final String nextLink;
  NextButtonPressed(this.nextLink);
}

class PrevButtonPressed extends SearchEvent{
  final String prevLink;
  PrevButtonPressed(this.prevLink);
}

class AddProductButton extends SearchEvent{

}