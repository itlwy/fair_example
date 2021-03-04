import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

import 'form_builder_custom_field.dart';

@FairBinding()
class TextFormFieldBuilder extends StatelessWidget {
  final String attribute;
  final ValueChanged<String> onChange;

  const TextFormFieldBuilder({Key key, this.attribute, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCustomField(
      attribute: attribute,
      formField: FormField<String>(builder: (FormFieldState<String> field) {
        return TextField(
          decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 16),
            hintText: "please input...",
          ),
          onChanged: (text) {
            field.didChange(text);
            onChange?.call(text);
          },
        );
      }),
    );
  }
}
