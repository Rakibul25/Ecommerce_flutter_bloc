abstract class EventCounter{}
//this event will occur when add icon pressed and will get quantity value
class IncrementEvent extends EventCounter{
  int value;
  IncrementEvent(this.value);
}
//this event will occur when remove icon pressed and will get quantity value
class DecrementEvent extends EventCounter{
  int value;
  DecrementEvent(this.value);
}