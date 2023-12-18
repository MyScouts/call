import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/di.dart';

class MarShopStatusBuilder extends StatefulWidget {
  const MarShopStatusBuilder({
    super.key,
    required this.uid,
    required this.builder,
  });

  final int uid;
  final Widget Function(bool isMarShopOwner) builder;

  @override
  State<MarShopStatusBuilder> createState() => _MarShopStatusBuilderState();
}

class _MarShopStatusBuilderState extends State<MarShopStatusBuilder> {
  late final controller = getIt<MarShopBuilderController>();

  @override
  void initState() {
    super.initState();
    controller
      ..setUid(widget.uid)
      ..fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.builder(controller.isMarShopOwner.value));
  }
}

@injectable
class MarShopBuilderController {
  final UserUsecase useCase;

  MarShopBuilderController(this.useCase);

  int _uid = 0;

  void setUid(int value) {
    _uid = value;
  }

  final RxBool _isMarShopOwner = false.obs;

  RxBool get isMarShopOwner => _isMarShopOwner;

  void fetch() async {
    final onBoard = await useCase.onboarding();
    _isMarShopOwner.value = onBoard.isMarshopOwner;
  }
}
