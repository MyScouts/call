import 'package:flutter/material.dart';

class DialogInputGift extends StatefulWidget {
  final String? init;
  const DialogInputGift({super.key,  this.init});

  @override
  State<DialogInputGift> createState() => _DialogInputGiftState();
}

class _DialogInputGiftState extends State<DialogInputGift> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if(widget.init !=null){
      controller.text = widget.init ?? '';
    }
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
                  'Nhập số quà',
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Nhập số quà',
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
                          onPressed: () async {
                            Navigator.pop(context, controller.text);
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
    ;
  }
}
