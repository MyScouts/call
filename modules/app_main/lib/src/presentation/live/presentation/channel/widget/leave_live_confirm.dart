import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaveLiveConfirm extends StatelessWidget {
  const LeaveLiveConfirm({super.key, required this.onRemoved});
  final VoidCallback onRemoved;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Thoát'),
      content: const Text('Bạn có muốn rời khỏi live?'),
      actions: [
        CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: const Text('Huỷ'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            onRemoved.call();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Đồng ý',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
