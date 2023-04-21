// dart packages
import 'dart:developer' as dev;
// flutter packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/models/counter_model.dart';

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier(this.ref): super(CounterModel(0));

  /// you can refer to the model using [state]
   
  // reference to StateNotifierProvider
  final Ref ref;

  void increment() {
    dev.log('CounterNotifier.increment()', name: 'counter_provider.dart');
    state.value++;
    ref.notifyListeners();
  }

  void decrement() {
    dev.log('CounterNotifier.decrement()', name: 'counter_provider.dart');
    state.value--;
    ref.notifyListeners();
  }

  void reset() {
    dev.log('CounterNotifier.reset()', name: 'counter_provider.dart');
    state.value = 0;
    ref.notifyListeners();
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, CounterModel>((ref) {
  return CounterNotifier(ref);
});

