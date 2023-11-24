import 'package:app_main/src/presentation/live/domain/entities/live_type.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class LiveTypePicker extends StatefulWidget {
  const LiveTypePicker({
    super.key,
    required this.onChanged,
    required this.type,
  });

  final Function(LiveType) onChanged;
  final LiveType type;

  @override
  State<LiveTypePicker> createState() => _LiveTypePickerState();
}

class _LiveTypePickerState extends State<LiveTypePicker> {
  LiveType _type = LiveType.public;

  @override
  void initState() {
    _type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(8.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: const CloseButton(),
              centerTitle: true,
              title: const Text(
                'Quyền riêng tư',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      widget.onChanged(_type);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Xong',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...LiveType.values.map((e) {
              return ListTile(
                onTap: () {
                  setState(() {
                    _type = e;
                  });
                },
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageWidget(e.pathImage),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.text,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6E6E6E),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Text(
                              e.description,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff8C8C8C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: Radio<LiveType>(
                  value: _type,
                  groupValue: e,
                  onChanged: (Object? value) {
                    setState(() {
                      _type = e;
                    });
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
