abstract class CounterEvent{}

class IncrementCountEvent extends CounterEvent{
  int value;
  IncrementCountEvent({required this.value});
}

class DecrementCountEvent extends CounterEvent{}