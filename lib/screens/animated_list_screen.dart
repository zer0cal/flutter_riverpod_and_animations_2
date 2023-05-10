// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;
import 'package:flutter_riverpod_and_animations_2/providers/animatedlist_provider.dart';

class AniatedListScreen extends ConsumerWidget {
  const AniatedListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log.widgetBuild(this);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Home')),
              ElevatedButton(
                  onPressed: () {
                        ref.read(modelProvider.notifier).push('name');
                      },
                  child: const Text('+')),
            ],
          ),
          const Expanded(child: ItemListBuilder())
        ],
      ),
    );
  }
}

class ItemListBuilder extends ConsumerWidget {
  const ItemListBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log.widgetBuild(this);
    final models = ref.watch(modelProvider);
    
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return AnimatedListItemWidget(index: index, onDelete: () {
              ref.read(modelProvider.notifier).remove(models[index]);
            }, child: Text('$index ${models[index].name}'));
        },
      );
  }
}
