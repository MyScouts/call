import 'package:flutter/material.dart';

class TimeCountDown extends StatelessWidget {
  final int timeRemain;
  final double size;
  final double padding;
  final double paddingBottom;

  const TimeCountDown({
    Key? key,
    required this.timeRemain,
    this.size = 76.0,
    this.padding = 6.0,
    this.paddingBottom = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: padding / 2),
          _renderItem(context, (timeRemain ~/ 60).toString(), 'hours'),
          _renderItem(context, (timeRemain % 60).toString(), 'minutes'),
          SizedBox(width: padding / 2),
        ],
      ),
    );
  }

  Widget _renderItem(BuildContext context, String time, String type) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 4),
          )
        ],
      ),
      width: size,
      height: size,
      margin:
          EdgeInsets.fromLTRB(padding / 2, padding, padding / 2, paddingBottom),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                color: Colors.black,
                fontSize: size / 2,
                height: 1.16,
              ),
            ),
            Text(
              type,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black.withAlpha((0.4 * 255).toInt()),
                    height: 1.14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
