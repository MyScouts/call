import 'package:flutter/material.dart';

class LiveSetPassword extends StatefulWidget {
  const LiveSetPassword({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  State<LiveSetPassword> createState() => _LiveSetPasswordState();
}

class _LiveSetPasswordState extends State<LiveSetPassword> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                leading: const SizedBox.shrink(),
                title: const Text(
                  'Đặt mật khẩu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                centerTitle: true,
                actions: const [
                  Center(child: CloseButton(color: Colors.black)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  controller: controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Nhập mật khẩu',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffACACAC),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xffEAEDF0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onChanged(controller.text);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                          backgroundColor: const Color(0xffF4F4F4),
                        ),
                        child: const Text(
                          'Hủy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff6E6E6E),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff015CB5),
                              Color(0xff0E86FC),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            widget.onChanged(controller.text);
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(48),
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Tiếp tục',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
