import 'dart:developer';

import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/ui_model/ja_contract_content_ui_model.dart';
import 'package:app_core/app_core.dart';
import 'package:pdf/widgets.dart';
import 'contract_ui_model.dart';
import 'default_textstyle.dart';

List<ContactPointInformationUIModel> getContactPointInformation(JAContractContentUIModel model) {
  log('PDoneData: ${model.pDoneInformationData}');
  return [
    ContactPointInformationUIModel(
      title: 'CÔNG TY CỔ PHẦN TẬP ĐOÀN CÔNG NGHỆ VIPTAM',
      footer: 'Sau đây gọi  là “Bên A”',
      contents: [
        const ContactPointInformationRowUIModel(
          title: 'Trụ sở',
          value: TextSpan(
            text:
                'Số 35, ngõ 269 đường Lạc Long Quân, phường Nghĩa Đô, quận Cầu Giấy, thành phố Hà Nội',
            style: defaultTextStyle,
          ),
        ),
        const ContactPointInformationRowUIModel(
          title: 'Mã số doanh nghiệp',
          value: TextSpan(
            text: '0109920478',
            style: defaultTextStyle,
          ),
        ),
        const ContactPointInformationRowUIModel(
          title: 'ĐT',
          value: TextSpan(
            text: '0346688979',
            style: defaultTextStyle,
          ),
        ),
        const ContactPointInformationRowUIModel(
          title: 'Email',
          value: TextSpan(
            text: 'viptamgroup@viptam.com',
            style: defaultTextStyle,
          ),
        ),
        ContactPointInformationRowUIModel(
          title: 'Đại diện bởi',
          value: TextSpan(
            text: 'Ông Nguyễn Thanh Tuấn',
            style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ContactPointInformationRowUIModel(
          title: 'Chức vụ',
          value: TextSpan(
            text: 'Chủ tịch Hội đồng quản trị',
            style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
    ContactPointInformationUIModel(
      title: 'ÔNG/BÀ ${model.pDoneInformationData?.fullName}',
      footer: 'Sau đây gọi  là “Bên B”',
      contents: [
        ContactPointInformationRowUIModel(
          title: 'Sinh ngày',
          value: TextSpan(
            text: model.user.getBirthday.getDisplayDate(),
            style: defaultTextStyle,
          ),
        ),
        ContactPointInformationRowUIModel(
          title: 'CCCD số',
          value: TextSpan(
            text:
                '${model.pDoneInformationData?.identityNumber} do ${model.pDoneInformationData?.supplyAddress} cấp ngày ${model.pDoneInformationData?.supplyDate?.getDisplayDate()}',
            style: defaultTextStyle,
          ),
        ),
        ContactPointInformationRowUIModel(
          title: 'Nơi đăng ký hộ khẩu thường trú',
          value: TextSpan(
            text: '${model.pDoneInformationData?.currentPlace?.fullAddress}',
            style: defaultTextStyle,
          ),
        ),
        ContactPointInformationRowUIModel(
          title: 'Chỗ ở hiện tại',
          value: TextSpan(text: '${model.pDoneInformationData?.currentPlace?.fullAddress}',
            style: defaultTextStyle,),
        ),
        ContactPointInformationRowUIModel(
          title: 'ĐT',
          value: TextSpan(
            text: model.user?.phone ?? '',
            style: defaultTextStyle,
          ),
        ),
        ContactPointInformationRowUIModel(
          title: 'Email',
          value: TextSpan(
            text: model.user.getEmail,
            style: defaultTextStyle,
          ),
        ),
      ],
    ),
  ];
}
