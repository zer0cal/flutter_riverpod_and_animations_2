// flutter packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/models/counter.dart';
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier(this.ref): super(CounterModel(0));

  /// you can refer to the model using [state]
   
  // reference to StateNotifierProvider
  final Ref ref;

  void increment() {
    log.providerNotify(this, 'increment');
    state.value++;
    ref.notifyListeners();
  }

  void decrement() {
    log.providerNotify(this, 'decrement');
    state.value--;
    ref.notifyListeners();
  }

  void reset() {
    log.providerNotify(this, 'reset');
    state.value = 0;
    ref.notifyListeners();
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, CounterModel>((ref) {
  return CounterNotifier(ref);
});

