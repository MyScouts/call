import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NotificationMock extends StatelessWidget {
  const NotificationMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 247, 0.70),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(11),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 38 / 2),
                SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'TungMinh123',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  '9:41 AM',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3F3F3F),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'TungMinh123, người mà bạn có thể biết'
            ' đang ở trên mạng xã hội P-Done.'
            ' Bạn có muốn theo dõi họ không?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
