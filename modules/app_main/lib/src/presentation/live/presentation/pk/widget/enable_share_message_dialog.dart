import 'package:flutter/material.dart';

class EnableShareMessageDialog extends StatelessWidget {
  const EnableShareMessageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Cho phép hiện bình luận',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 2.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CloseButton(),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Bạn có đồng ý hiện bình luận trong Livestream'
              ' này lên livestream hiện tại không ?',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6E6E6E),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  onPressed: Navigator.of(context).pop,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Hủy bỏ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffDE372D),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff0E86FC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Hiện bình luận',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
