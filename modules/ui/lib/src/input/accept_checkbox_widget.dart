import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class AcceptCheckBoxWidget extends StatefulWidget {
  const AcceptCheckBoxWidget(
      {super.key, required this.accept, required this.child});

  final Widget child;
  final ValueNotifier<bool> accept;

  @override
  State<AcceptCheckBoxWidget> createState() => _AcceptCheckBoxWidgetState();
}

class _AcceptCheckBoxWidgetState extends State<AcceptCheckBoxWidget> {
  late final ValueNotifier<bool> _acceptTerm;

  @override
  void initState() {
    super.initState();
    _acceptTerm = widget.accept;
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                child: widget.child,
              ),
            ],
          ),
        );
      },
    );
  }
}
