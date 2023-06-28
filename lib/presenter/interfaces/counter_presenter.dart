import '../../view/interfaces/counter_view.dart';

abstract class CounterPresenter {
  void incrementCounter();
  void decrementCounter();
  set setCounterView(CounterView counter);
}