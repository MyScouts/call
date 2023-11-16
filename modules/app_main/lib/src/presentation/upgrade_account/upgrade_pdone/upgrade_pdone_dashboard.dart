import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/upgrade_pdone_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../data/models/responses/pdone/pdone_information_response.dart';
import 'bloc/pdone_information/pdone_information_bloc.dart';

class UpgradePDoneDashboard extends StatefulWidget {
  static const String routeName = '/pdone-profile';

  const UpgradePDoneDashboard({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpgradePDoneDashboardState();
  }
}

class _UpgradePDoneDashboardState extends State<UpgradePDoneDashboard> {
  PDoneInformationBloc get pDoneInformationBloc =>
      context.read<PDoneInformationBloc>();

  PDoneInformationData? data;

  String getMethod() {
    if (data?.type == 4 || data?.type == 3) {
      return 'Dùng căn cước';
    }

    if (data?.type == 1 || data?.type == 2) {
      return 'Dùng giấy khai sinh'
          '';
    }

    return '';
  }

  String getAge() {
    if (data?.type == 4) {
      return 'Trên 15 tuổi';
    }
    if (data?.type == 3) {
      return 'Dưới 15 tuổi';
    }

    if (data?.type == 1 || data?.type == 2) {
      return 'Trên 14 tuổi';
    }

    return '';
  }

  String getStatus() {
    print('data?.type : ${data?.type}');
    if (data?.type == 0) {
      return 'Đang xác thực';
    }

    return 'Đã xác thực';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pDoneInformationBloc.add(PDoneGetInformationEvent());
  }

  void _onListenerBloc(BuildContext context, PDoneInformationState state) {
    if (state is PDoneLoadedSuccessInformation) {
      data = state.data;
    }

    if (state is PDoneNotYetRegisterState) {
      Navigator.of(context).pushReplacementNamed(
        UpgradePDoneScreen.routeName,
      );
    }

    if (state is PDoneLoadedFailureInformation) {
      showToastMessage(state.errorMessage);
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 248, 255, 1),
      appBar: AppBar(
        title: const Text('Cập nhật PDONE'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(243, 248, 255, 1),
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: BlocListener<PDoneInformationBloc, PDoneInformationState>(
        listener: _onListenerBloc,
        child: BlocBuilder<PDoneInformationBloc, PDoneInformationState>(
            bloc: pDoneInformationBloc,
            builder: (context, state) {
              if (state is PDoneLoadingInformation) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(context),
                    _buildBody(context),
                    _buildNoti(context),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Thông tin PDONE',
      style: context.textTheme.labelLarge!.copyWith(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          _buildComponentBodyMethod(context),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 0.5,
            color: Colors.black26,
          ),
          _buildComponentBodyAge(context),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 0.5,
            color: Colors.black26,
          ),
          _buildComponentBodyStatus(context),
        ],
      ),
    );
  }

  Widget _buildComponentBodyMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Phương thức',
            style: context.textTheme.labelLarge!.copyWith(fontSize: 16),
          ),
          Text(
            getMethod(),
          ),
        ],
      ),
    );
  }

  Widget _buildComponentBodyAge(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Độ tuổi',
            style: context.textTheme.labelLarge!.copyWith(fontSize: 16),
          ),
          Text(
            getAge(),
          ),
        ],
      ),
    );
  }

  Widget _buildComponentBodyStatus(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trạng thái',
            style: context.textTheme.labelLarge!.copyWith(fontSize: 16),
          ),
          Text(
            getStatus(),
          ),
        ],
      ),
    );
  }

  Widget _buildNoti(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageWidget(
            ImageConstants.pDoneNotification,
            width: 130,
            height: 120,
          ),
          const SizedBox(
            height: 23,
          ),
          Text(
            'Bạn đang là tài khoản PDONE ${getAge().toLowerCase()}.\nNếu có thay đổi về độ tuổi của bạn\nVui lòng nâng cấp!',
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall!.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
