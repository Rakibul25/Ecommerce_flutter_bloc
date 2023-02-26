import 'dart:async';
import 'streamEvent.dart';
//©Rakibul Islam

class Bloc_Counter{
  //default counter value
  int _counter =1;
  //StreamController handle input and output
  final _counterStateController = StreamController<int>();
  //Sink
  StreamSink<int> get _inCounter =>_counterStateController.sink;
  // Stream
  Stream<int> get counter =>_counterStateController.stream;
  //event controller to trigger which event has occurred
  final _counterEventController = StreamController<EventCounter>();
  Sink<EventCounter> get counterEventSink =>_counterEventController.sink;

  Bloc_Counter(){
    _counterEventController.stream.listen((_mapEventtoState));
  }
  void _mapEventtoState(EventCounter event){
    // depending on event either increment or decrement the counter variable
    if(event is IncrementEvent){
      event.value++;
      _counter = event.value;
    }
    if(event is DecrementEvent){
      if(event.value<=0){
        event.value = event.value;
        _counter = event.value;
      }else{
        event.value--;
        _counter = event.value;
      }
    }
    _inCounter.add(_counter);
  }
  // Disposing the Controller
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}