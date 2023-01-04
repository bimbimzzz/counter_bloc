import 'dart:async';

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

//StreamController adalah sebuah class yang mengatur tentang aliran data
//StreamController ada 2 komponen yaitu StreamSink dan Stream

//StreamSink adalah tempat masuknya data atau sebagai input
//Stream adalah tempat aliran data, yang mana data yang masuk melalui sink akan di alirkan melalui stream

class CounterBloc {
  //todo : create state stream controller & initial value
  int _value = 0;

  //todo : create event stream controller, tiap Stream Controller mempunyai 2 komponen yaitu StreamSink dan Stream
  StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();

  StreamSink<CounterEvent> get eventSink => _eventController.sink;
  Stream<CounterEvent> get _eventStream => _eventController.stream;

  //todo : create state stream controller, tiap Stream Controller mempunyai 2 komponen yaitu StreamSink dan Stream
  StreamController<int> _stateController = StreamController<int>();

  StreamSink<int> get _stateSink => _stateController.sink;
  Stream<int> get stateStream => _stateController.stream;

  //todo : create method mappingEventToState
  void _mappingEventToState(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      _value++;
    } else {
      _value--;
    }

    _stateSink.add(_value);
  }

  CounterBloc() {
    _eventStream.listen(_mappingEventToState);
  }

  //todo : create void dispose(){}
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
