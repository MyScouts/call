import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

class TransactionFilterSheet extends StatefulWidget {
  const TransactionFilterSheet({super.key});

  @override
  State<TransactionFilterSheet> createState() => _TransactionFilterSheetState();
}

class _TransactionFilterSheetState extends State<TransactionFilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
      ],
    );
  }

  _buildHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: context.popNavigator,
          icon: const Icon(
            Icons.close,
            color: Color(0xFF1D2B39),
          ),
        )
      ],
    );
  }
}
