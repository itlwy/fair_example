import 'package:flutter/material.dart';

class FormBuilderValidators {
  /// 非空判断
  static FormFieldValidator required({
    String errorText = '输入不能为空',
  }) {
    return (valueCandidate) {
      if (valueCandidate == null ||
          ((valueCandidate is Iterable ||
                  valueCandidate is String ||
                  valueCandidate is Map) &&
              valueCandidate.length == 0)) {
        return errorText;
      }
      return null;
    };
  }

  /// 限制最小长度
  static FormFieldValidator minLength(
    num minLength, {
    String errorText,
  }) {
    return (valueCandidate) {
      final valueLength = valueCandidate?.length ?? 0;
      if (valueLength < minLength) {
        return errorText ?? '输入得不少于$minLength';
      }
      return null;
    };
  }

  /// 限制最大长度
  static FormFieldValidator maxLength(
    num maxLength, {
    String errorText,
  }) {
    return (valueCandidate) {
      if (valueCandidate != null && valueCandidate.length > maxLength) {
        return errorText ?? '输入不得大于$maxLength';
      }
      return null;
    };
  }

  /// Common validator method that tests [val] against [validators].  When a
  /// validation generates an error message, it it returned, otherwise null.
  static String validateValidators<T>(
      T val, List<FormFieldValidator> validators) {
    for (var i = 0; i < validators.length; i++) {
      final validatorResult = validators[i](val);
      if (validatorResult != null) {
        return validatorResult;
      }
    }
    return null;
  }
}
