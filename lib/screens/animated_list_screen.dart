// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;
import 'package:flutter_riverpod_and_animations_2/providers/animatedlist_provider.dart';
import 'package:flutter_riverpod_and_animations_2/widgets/animated_list_item_widget.dart';

class AniatedListScreen extends ConsumerWidget {
  AniatedListScreen({super.key});

  final listBuilder = ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return const SizedBox(height: 400, width: 300, child: AnimatedListItemWidget());
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log.widgetBuild(this);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Home')),
              ElevatedButton(onPressed: () => ref.read(selfDeleteProvider.notifier).deleted(), child: const Text('--'))
          ],),
          AnimatedListItemWidget()
        ],
      ),
    );
  }
}