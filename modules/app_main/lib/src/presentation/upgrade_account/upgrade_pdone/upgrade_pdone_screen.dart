import 'package:flutter/material.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import '../upgrade_account_constants.dart';
import '../upgrade_ja/widgets/steper_update_pdone.dart';
import 'pages/register_pdone_account_page.dart';
import 'pages/update_kyc_page.dart';
import 'pages/update_pdone_information_page.dart';

class UpgradePDoneScreen extends StatefulWidget {
  static const String routeName = '/update-pdone';

  const UpgradePDoneScreen({
    super.key,
    required this.currentStep,
  });

  final int currentStep;

  @override
  State<UpgradePDoneScreen> createState() => _UpgradePDoneScreenState();
}

class _UpgradePDoneScreenState extends State<UpgradePDoneScreen>
    with ValidationMixin {
  late PageController _pageController;

  int currentIndex = 0;

  void nextPage(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.currentStep < KycStep.values.length) {
      currentIndex = widget.currentStep;
      _pageController = PageController(initialPage: widget.currentStep);
    } else {
      _pageController = PageController();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký thành viên P-Done '),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Column(
        children: [
          StepperVerifyWidget(
            currentIndex: currentIndex,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                UpdateKycPage(onNextPage: () => nextPage(1)),

                UpdatePDoneInformationPage(onNextPage: () => nextPage(2)),
                RegisterPDoneAccountPage(
                  onNextPage: () {},
                )

                // const RegisterStatePage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
