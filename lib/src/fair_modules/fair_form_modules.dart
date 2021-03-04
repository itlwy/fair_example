import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

class CFormFieldModule extends FairWidgetModule {
  static String tagName = 'FormField';

  CFormFieldModule() : super(tagName);

  @override
  Widget onCreateComponent(BuildContext ctx, Map<String, dynamic> props) {
    var child = props['builder'];
    return FormField(
      key: props['key'],
      builder: (_) => child,
      onSaved: props['onSaved'],
      validator: props['validator'],
      initialValue: props['initialValue'],
      autovalidate: props['autovalidate'] ?? false,
      enabled: props['enabled'] ?? true,
      autovalidateMode: props['autovalidateMode'],
    );
  }
}
