import 'package:flutter/material.dart';

class NoticeDialog extends StatefulWidget {
  final String title;

  const NoticeDialog({super.key, required this.title});

  @override
  State<NoticeDialog> createState() => _NoticeDialogState();
}

class _NoticeDialogState extends State<NoticeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Visibility(visible: false, child: Icon(Icons.clear)),
                  const Text(
                    "Thông báo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.clear)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff6E6E6E)),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4B84F7),
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                Navigator.pop(context);
              }, child: const Text('Xác nhận')),
            ),
            const SizedBox(height: 14),

          ],
        ),
      ),
    );
  }
}
