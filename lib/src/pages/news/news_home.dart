import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

import 'delegate/news_home_delegate.dart';
import 'widget/list_container.dart';

@FairPatch()
class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  NewsHomeDelegate delegate;

  @override
  void initState() {
    super.initState();
    delegate = NewsHomeDelegate();
    delegate.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: delegate.tabLength,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            delegate.title,
          ),
          bottom: TabBar(
              tabs: Sugar.map(delegate.tabs, builder: (item) {
            return Tab(
                child: Text(
              item,
              style: TextStyle(color: Colors.white),
            ));
          })),
        ),
        body: TabBarView(
          children: Sugar.map(delegate.dataSources, builder: (item) {
            return ListContainer(item);
          }),
        ),
      ),
    );
  }
}
