import 'package:base_mvp/model/counter.dart';
import 'package:base_mvp/presenter/interfaces/counter_presenter.dart';
import 'package:base_mvp/view/interfaces/counter_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.presenter, {Key? key, required this.title})
      : super(key: key);
  final String title;
  final CounterPresenter presenter;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements CounterView {
  late Counter counter;

  @override
  void initState() {
    super.initState();
    widget.presenter.setCounterView = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Click buttons to add and substract",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    widget.presenter.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                Text(
                  counter.value.toString(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                FloatingActionButton(
                  onPressed: () {
                    widget.presenter.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void refreshCounter(Counter counter) {
    setState(() {
      this.counter = counter;
    });
  }
}
