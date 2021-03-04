import 'package:fair/fair.dart';
import 'package:fair_example/src/utils/form/form_builder.dart';
import 'package:fair_example/src/utils/form/form_builder_custom_field.dart';
import 'package:fair_example/src/utils/form/form_field_builder.dart';
import 'package:flutter/material.dart';

import 'form_delegate.dart';

@FairPatch()
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FormDelegate delegate = FormDelegate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单示例'),
      ),
      body: FormBuilder(
        key: delegate.formKey,
        onChanged: delegate.formValuesChanged,
        autovalidate: true,
        initialValue: delegate.initialValue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 48, right: 48),
              child: Row(
                children: [
                  Text(
                    '标题 : ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: TextFormFieldBuilder(
                      attribute: 'title',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 48, right: 48),
              child: Row(
                children: [
                  Text(
                    '内容 : ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: TextFormFieldBuilder(
                      attribute: 'content',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 48,
                right: 48,
                top: 24,
              ),
              child: RaisedButton(
                onPressed: delegate.onSubmit,
                child: Center(child: Text('Submit')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
