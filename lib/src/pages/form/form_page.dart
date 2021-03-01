import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单示例'),
      ),
      body: Center(
        child: Container(
          child: Text('表单示例'),
        ),
      ),
    );
  }
}
