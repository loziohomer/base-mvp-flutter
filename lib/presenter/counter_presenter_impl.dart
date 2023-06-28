import 'package:base_mvp/model/counter.dart';
import 'package:base_mvp/presenter/interfaces/counter_presenter.dart';
import '../view/interfaces/counter_view.dart';

class CounterPresenterImpl implements CounterPresenter {
  late CounterView view;
  Counter counter = Counter();

  @override
  void decrementCounter() {
    counter.value--;
    view.refreshCounter(counter);
  }

  @override
  void incrementCounter() {
    counter.value++;
    view.refreshCounter(counter);
  }

  @override
  set setCounterView(CounterView view) {
    this.view = view;
    view.refreshCounter(counter);
  }
}