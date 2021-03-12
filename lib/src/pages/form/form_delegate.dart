import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

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
      // calculateMD5();
      print('Processing Data ${formKey.currentState.value.toString()}');
    }
  }

  void calculateMD5() {
    String content = "What a fine day, I can do a lot of funny stuffddd.";
    for (int i = 0; i < 1000; i++) {
      List<int> contentConvert = utf8.encode(content);
      var digest = md5.convert(contentConvert);
      var result = hex.encode(digest.bytes);
      print("md5 result: $result");
    }
  }
}
