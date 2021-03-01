import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

class HomePageDelegate extends FairDelegate {
  final ValueNotifier<int> _count = ValueNotifier<int>(0);

  @override
  Map<String, Function> bindFunction() {
    var functions = super.bindFunction();
    functions.addAll({});
    return functions;
  }

  @override
  Map<String, PropertyValue> bindValue() {
    var pros = super.bindValue();
    pros.addAll({
      '_platform': () => 'Fair v$fairVersion',
      '_count': () => _count,
      'name': () => '动态首页',
    });
    return pros;
  }
}
