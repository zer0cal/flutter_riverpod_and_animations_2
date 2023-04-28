// flutter packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeNotifier extends StateNotifier<double> {
  SizeNotifier(this.ref): super(100); 

  final Ref ref;

  void increase(double value) {
    state += value;
    ref.notifyListeners();
  }

  void decrease(double value) {
    state -= value;
    ref.notifyListeners();    
  }
}

final sizeProvider = StateNotifierProvider<SizeNotifier, double>((ref) => SizeNotifier(ref));