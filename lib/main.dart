import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

import 'src/fair_modules/fair_modules.dart';
import 'src/generated.fair.dart';
import 'src/home/home_page_delegate.dart';
import 'src/pages/news/delegate/news_home_delegate.dart';

Map<String, FairModuleBuilder> _generateModules() => {
      ShowFairToastModule.tagName: () => ShowFairToastModule(),
    };

Map<String, FairDelegateBuilder> _generateDelegates() => {
      'home_page': (ctx, _) => HomePageDelegate(),
      'news_home_page': (ctx, _) => NewsHomeDelegate(),
    };

void main() {
  runApp(FairApp(
    delegate: _generateDelegates(),
    modules: _generateModules(),
    generated: AppGeneratedModule(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fair Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: _generateRoutes(),
      home: FairWidget(
        name: 'home_page',
        path:
            'http://192.168.31.249:1337/static/bundles/lib_src_home_home_page.fair.json',
      ),
//      src.home: HomePage(),
    );
  }

  Map<String, WidgetBuilder> _generateRoutes() => {
        '/form_page': (_) => FairWidget(
            path:
                'http://192.168.31.249:1337/static/bundles/lib_src_pages_form_form_page.fair.json'),
//        '/news_home_page': (_) => NewsHome(),
        '/news_home_page': (_) => FairWidget(
            name: 'news_home_page',
            path:
                'http://192.168.31.249:1337/static/bundles/lib_src_pages_news_news_home.fair.json'),
      };
}
