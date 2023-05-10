// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/models/animated_list_item_model.dart';
import 'package:flutter_riverpod_and_animations_2/widgets/animated_list_item_widget.dart';
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;


final modelProvider = StateNotifierProvider<ModelNotifier, List<AnimatedItemModel>>((ref) {
  return ModelNotifier(ref);
});

class ModelNotifier extends StateNotifier<List<AnimatedItemModel>> {
  ModelNotifier(this.ref): super([]);
  
  final Ref ref;

  void push(String name) {
    log.providerNotify(this, 'push($name)');
    state.add(AnimatedItemModel('${state.length + 1}. $name'));
    ref.notifyListeners();
  }

  void remove(AnimatedItemModel model) {
    log.providerNotify(this, 'remove($model)');
    state.remove(model);
    ref.notifyListeners();
  }
}
