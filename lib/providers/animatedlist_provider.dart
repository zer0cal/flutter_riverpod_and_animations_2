// flutter packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfDeleteNotifier extends StateNotifier<bool> {
  SelfDeleteNotifier(this.ref): super(false);

  void deleted() {
    state = true;
    ref.notifyListeners();
  }

  final Ref ref;
}

final selfDeleteProvider = StateNotifierProvider<SelfDeleteNotifier, bool>((ref) {
  return SelfDeleteNotifier(ref);
});