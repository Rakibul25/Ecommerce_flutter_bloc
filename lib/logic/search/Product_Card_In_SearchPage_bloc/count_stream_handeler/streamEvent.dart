abstract class EventCounter{}
//abstract class to find out which Event was occurred
class IncrementEvent extends EventCounter{
  int value;
  IncrementEvent(this.value);
}
class DecrementEvent extends EventCounter{
  int value;
  DecrementEvent(this.value);
}