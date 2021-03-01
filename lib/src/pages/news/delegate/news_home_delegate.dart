import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

class NewsHomeDelegate extends FairDelegate {
  final ValueNotifier<String> _title = ValueNotifier<String>('资讯示例');
  List<String> tabs = ['新闻', '历史', '图片'];
  List<List<NewsModel>> dataSources;

  String get title => _title.value;

  int get tabLength => tabs.length;

  @override
  void initState() {
    dataSources = tabs
        .map((e) => List.generate(10, (index) => "$e的列表${index + 1}")
            .map((e) => NewsModel(e, "$e 的内容",
                'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=463432120,4249196791&fm=26&gp=0.jpg'))
            .toList())
        .toList();
    super.initState();
  }

  @override
  Map<String, PropertyValue> bindValue() {
    var pros = super.bindValue();
    pros.addAll({
      'delegate.content': () => _title.value,
      'delegate.tabs': () => tabs,
      'delegate.dataSources': () => dataSources,
      'delegate.tabLength': () => tabLength,
    });
    return pros;
  }

  @override
  Map<String, Function> bindFunction() {
    var functions = super.bindFunction();
    functions.addAll({
      'delegate.test': test,
    });
    return functions;
  }

  void test() {
    print('hahaha');
  }
}

class NewsModel {
  final String title;
  final String content;
  final String backgroundUrl;

  NewsModel(this.title, this.content, this.backgroundUrl);
}
