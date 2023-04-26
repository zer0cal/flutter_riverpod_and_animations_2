import 'dart:developer' as dev;

void widgetBuild(dynamic widget) {
  dev.log('${widget.runtimeType}.build()', name: 'widget.build');
}

void providerNotify(dynamic provider, String action) {
  dev.log('${provider.runtimeType}.$action()', name: 'provider.notify');
}

void tweenAnimation(dynamic widget, String name) {
  dev.log('${widget.runtimeType}.$name', name: 'widget.tween_animation');
}

void hookAnimation(dynamic widget, String name) {
  dev.log('${widget.runtimeType}.$name', name: 'widget.hook_animation');
}