import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:flutter/material.dart';

class InviteNoticeDialog extends StatefulWidget {
  final String title;
  final int liveId;

  const InviteNoticeDialog({super.key, required this.title, required this.liveId});

  @override
  State<InviteNoticeDialog> createState() => _NoticeDialogState();
}

class _NoticeDialogState extends State<InviteNoticeDialog> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff6E6E6E)),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF4F4F4), foregroundColor: Color(0xff6E6E6E)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Hủy')),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4B84F7), foregroundColor: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                          context.joinLive(widget.liveId);
                        },
                        child: const Text('Xác nhận')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
