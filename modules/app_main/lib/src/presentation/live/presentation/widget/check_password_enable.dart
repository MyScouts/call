import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/domain/usecases/live_usecases.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

class LiveCheckPassword extends StatefulWidget {
  const LiveCheckPassword({
    super.key,
    required this.id,
    required this.onPass,
  });

  final int id;
  final Function(String password) onPass;

  @override
  State<LiveCheckPassword> createState() => _LiveSetPasswordState();
}

class _LiveSetPasswordState extends State<LiveCheckPassword> {
  final TextEditingController controller = TextEditingController();
  final liveController = getIt<LiveCheckPasswordController>();
  String? _message;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      controller: controller,
                      maxLines: 1,
                      decoration: InputDecoration(
                        counter: ListenableBuilder(
                          listenable: controller,
                          builder: (_, __) => Text(
                            '${controller.text.length}/30',
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xffACACAC)),
                          ),
                        ),
                        hintText: 'Nhập mật khẩu',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xffACACAC),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xffEAEDF0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    if (_message != null)
                      ...[
                        Text(
                          _message!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ],
                  ],
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
                            if (controller.text.trim().isEmpty) {
                              setState(() {
                                _message = 'Mật khẩu rỗng';
                              });
                              return;
                            }
                            try {
                              showLoading();
                              final ok = await liveController.check(
                                widget.id,
                                controller.text,
                              );
                              hideLoading();
                              if (!ok) {
                                setState(() {
                                  _message = 'Mật khẩu không đúng';
                                });
                              } else {
                                if (mounted) {
                                  Navigator.of(context).pop();
                                  widget.onPass(controller.text);
                                }
                              }
                            } catch (e) {
                              hideLoading();
                            }
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

@injectable
class LiveCheckPasswordController {
  final LiveUseCase useCase;

  LiveCheckPasswordController(this.useCase);

  Future<bool> check(int liveID, String password) async {
    return useCase.checkPass(liveID, password);
  }
}
