import 'package:fair/fair.dart';
import 'package:fair_example/src/utils/form/form_builder.dart';
import 'package:flutter/material.dart';

class FormDelegate extends FairDelegate {
  final _formKey = GlobalKey<FormBuilderState>();

  get formKey => _formKey;

  get initialValue => {
        'title': 'default title',
      };

  @override
  Map<String, PropertyValue> bindValue() {
    var pros = super.bindValue();
    pros.addAll({
      'delegate.formKey': () => formKey,
      'delegate.initialValue': () => initialValue,
    });
    return pros;
  }

  @override
  Map<String, Function> bindFunction() {
    var functions = super.bindFunction();
    functions.addAll({
      'delegate.formValuesChanged': formValuesChanged,
      'delegate.onSubmit': onSubmit,
    });
    return functions;
  }

  formValuesChanged(Map<String, dynamic> values) {
    print('FormBuilder onChanged : ${formKey.currentState.value.toString()}');
  }

  void onSubmit() {
    formKey.currentState.save();
    if (formKey.currentState.validate()) {
      print('Processing Data ${formKey.currentState.value.toString()}');
    }
  }
}
