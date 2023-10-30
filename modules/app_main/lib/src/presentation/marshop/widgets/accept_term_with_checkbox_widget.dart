import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'policy_widget.dart';

class AcceptTermWithCheckboxWidget extends StatefulWidget {
  const AcceptTermWithCheckboxWidget({
    super.key,
    required this.acceptTerm,
  });

  final ValueNotifier<bool> acceptTerm;

  @override
  State<AcceptTermWithCheckboxWidget> createState() =>
      _AcceptTermWithCheckboxWidgetState();
}

class _AcceptTermWithCheckboxWidgetState
    extends State<AcceptTermWithCheckboxWidget> {
  late final ValueNotifier<bool> _acceptTerm;

  @override
  void initState() {
    super.initState();

    _acceptTerm = widget.acceptTerm;
  }

  void _onChangedCheckbox(bool? value) {
    _acceptTerm.value = value == true;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _acceptTerm,
      builder: (_, __, ___) {
        return GestureDetector(
          onTap: () {
            _acceptTerm.value = !_acceptTerm.value;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _acceptTerm.value,
                activeColor: context.theme.primaryColor,
                onChanged: _onChangedCheckbox,
                visualDensity: const VisualDensity(horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: PolicyWidget(
                    isAccepted: _acceptTerm.value,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
