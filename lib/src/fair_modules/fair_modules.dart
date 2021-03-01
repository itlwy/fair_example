import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import '../utils/toast.dart';

class ShowFairToastModule extends FairVoidCallbackModule {
  static String tagName = 'Toast.show';

  ShowFairToastModule() : super(tagName);

  @override
  VoidCallback onCreateComponent(BuildContext ctx, Map<String, dynamic> props) {
    return () => Toast.show(props['pa'][0], ctx);
  }
}
