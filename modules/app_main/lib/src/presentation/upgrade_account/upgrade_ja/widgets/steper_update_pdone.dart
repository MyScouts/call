import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class StepperVerifyWidget extends StatelessWidget {
  final List<String> titles;
  final int currentIndex;

  const StepperVerifyWidget({
    super.key,
    this.titles = const [
      'Định danh điện tử',
      'Cập nhật thông tin',
      'Xác minh',
      'Trạng thái'
    ],
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 20, 8, 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal:65.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                titles.length,
                    (index) => _containerStep(context, index),
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 15.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: List<Widget>.generate(
          //       titles.length,
          //           (index) => _renderTitle(context, index),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _renderTitle(BuildContext context, int index) {
    return Container(
      width: 80,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        titles[index],
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 10,
          color: index == currentIndex ? AppColors.blue10 : AppColors.grey8,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _containerStep(BuildContext context, int index) {
    return index != titles.length - 1
        ? Expanded(
      child: Row(
        children: <Widget>[
          _renderCircle(context, index),
          Expanded(
            child: Container(
              height: 1.0,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: index < currentIndex
                  ? AppColors.blue10
                  : AppColors.grey8,
            ),
          )
        ],
      ),
    )
        : _renderCircle(context, index);
  }

  Widget _renderCircle(BuildContext context, int index) {
    return Container(
      height: 16,
      width: 16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: index <= currentIndex
            ? Theme.of(context).themeDecoration.gradientPrimary
            : null,
        color: index != currentIndex ? AppColors.grey8 : null,
      ),
      // child: Text(
      //   '${index + 1}',
      //   style: const TextStyle(color: Colors.white),
      // ),
    );
  }
}