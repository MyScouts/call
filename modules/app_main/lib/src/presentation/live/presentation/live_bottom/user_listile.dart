import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class UserLisTile extends StatefulWidget {
  final User user;
  final ValueChanged<User> onChanged;
  final bool isInvited;

  const UserLisTile({super.key, required this.user, required this.onChanged, this.isInvited = false});

  @override
  State<UserLisTile> createState() => _UserLisTileState();
}

class _UserLisTileState extends State<UserLisTile> {
  bool isInvited = false;

  @override
  void initState() {
    isInvited = widget.isInvited;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          AvatarWidget(
            avatar: widget.user.avatar,
            size: 36,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(widget.user.fullNameStr,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ImageWidget(widget.user.sexCodeValue.getIcon1()),
                    const SizedBox(width: 4),
                    const Row(
                      children: [
                        Text("Lv.15",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isInvited) {
                return;
              } else {
                widget.onChanged(widget.user);
                setState(() {
                  isInvited = !isInvited;
                });
              }
            },
            child: isInvited
                ? const Text("Đã mời",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff6E6E6E)))
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 9.5, horizontal: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xff4B84F7)),
                    child: const Text("Mời",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
          )
        ],
      ),
    );
  }
}
