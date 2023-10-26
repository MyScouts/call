import 'package:flutter/material.dart';

import '../easy_debounce.dart';

typedef ValidationBuilder = Widget Function(bool isValid);

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final _validationListener = ValueNotifier<bool>(false);

  ValueNotifier<bool> get validationListener => _validationListener;

  bool get conditionValidator => true;

  bool get isValidForm => checkValidation();

  void onValidation([Duration debounce = const Duration(milliseconds: 300)]) {
    EasyDebounce.debounce('debounceValidation_$hashCode', debounce, () {
      _validationListener.value = checkValidation();
    });
  }

  Widget validationFormBuilder({required Widget child}) {
    return Form(key: formKey, child: child);
  }

  Widget validationListenableBuilder({required ValidationBuilder builder}) {
    return ValueListenableBuilder<bool>(
      valueListenable: _validationListener,
      builder: (context, value, child) {
        return builder(value);
      },
    );
  }

  bool checkValidation() {
    final valid =
        (_formKey.currentState?.validate() ?? false) && conditionValidator;
    _validationListener.value = valid;
    return valid;
  }
}
