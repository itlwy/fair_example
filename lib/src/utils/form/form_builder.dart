import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

typedef ValueTransformer<T> = dynamic Function(T value);

@FairBinding()
class FormBuilder extends StatefulWidget {
  //final BuildContext context;
  final Function(Map<String, dynamic>) onChanged;
  final WillPopCallback onWillPop;
  final Widget child;
  final bool readOnly;
  final bool autovalidate;
  final Map<String, dynamic> initialValue;

  /// 是否显示验证失败的不同样式
  final bool showValidateStyle;

  const FormBuilder({
    Key key,
    @required this.child,
    this.readOnly = false,
    this.onChanged,
    this.autovalidate = false,
    this.onWillPop,
    this.showValidateStyle = true,
    this.initialValue = const {},
  }) : super(key: key);

  static FormBuilderState of(BuildContext context) =>
      context.findAncestorStateOfType<FormBuilderState>();

  @override
  FormBuilderState createState() => FormBuilderState();
}

class FormBuilderState extends State<FormBuilder> {
  //TODO: Find way to assert no duplicates in field attributes
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, GlobalKey<FormFieldState>> _fieldKeys;

  Map<String, dynamic> _value;

  Map<String, dynamic> get value => {...widget.initialValue ?? {}, ..._value};

  Map<String, dynamic> get initialValue => widget.initialValue;

  Map<String, GlobalKey<FormFieldState>> get fields => _fieldKeys;

  bool get readOnly => widget.readOnly;

  @override
  void initState() {
    _fieldKeys = {};
    _value = {};
    super.initState();
  }

  @override
  void dispose() {
    _fieldKeys = null;
    super.dispose();
  }

  void setAttributeValue(String attribute, dynamic value) {
    if (attribute == '') return;

    setState(() {
      _value[attribute] = value;
    });
  }

  void setAttributeMap(Map<String, dynamic> value) {
    setState(() {
      _value.addAll(value);
    });
  }

  void registerFieldKey(String attribute, GlobalKey key) {
    if (attribute == '') return;
    _fieldKeys[attribute] = key;
  }

  void unregisterFieldKey(String attribute) {
    if (attribute == '') return;

    _fieldKeys.remove(attribute);
  }

  void save() {
    _formKey.currentState.save();
  }

  bool validate() {
    return _formKey.currentState.validate();
  }

  bool saveAndValidate() {
    _formKey.currentState.save();
    return _formKey.currentState.validate();
  }

  void reset() {
    _fieldKeys.forEach((mapKey, fieldKey) {
      fieldKey.currentState.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child,
      autovalidate: widget.autovalidate,
      onWillPop: widget.onWillPop,
      onChanged: () {
        if (widget.onChanged != null) {
          save();
          widget.onChanged(value);
        }
      },
    );
  }
}
