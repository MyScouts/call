import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoveConfirmDialog extends StatelessWidget {
  const RemoveConfirmDialog({super.key, required this.onRemoved});

  final Function() onRemoved;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Xoá'),
      content: const Text('Bạn có muốn xoá app?'),
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
            'Xoá',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
