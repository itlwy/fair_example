import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @FairWell('name')
  String name = "首页";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text(
                '表单示例',
              ),
              onPressed: () => Navigator.pushNamed(context, '/form_page'),
            ),
            RaisedButton(
              child: Text(
                '资讯示例',
              ),
              onPressed: () => Navigator.pushNamed(context, '/news_home_page'),
            )
          ],
        ),
      ),
    );
  }
}
