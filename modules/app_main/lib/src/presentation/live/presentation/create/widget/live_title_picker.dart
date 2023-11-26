import 'package:flutter/material.dart';

class LiveTitlePicker extends StatefulWidget {
  const LiveTitlePicker({
    super.key,
    required this.title,
    required this.onChanged,
  });

  final String title;
  final Function(String) onChanged;

  @override
  State<LiveTitlePicker> createState() => _LiveTitlePickerState();
}

class _LiveTitlePickerState extends State<LiveTitlePicker> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.title;
    super.initState();
  }

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
                  'Tiêu đề',
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
                  autofocus: true,
                  controller: controller,
                  maxLines: 3,
                  maxLength: 30,
                  decoration: InputDecoration(
                    counter: ListenableBuilder(
                      listenable: controller,
                      builder: (_, __) =>
                          Text(
                            '${controller.text.length}/30',
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xffACACAC)),
                          ),
                    ),
                    hintText: 'Nhập tiêu đề phát trực tiếp',
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
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    widget.onChanged(controller.text);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(48),
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                  child: const Text('Đặt', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),),
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
