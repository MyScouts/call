import 'package:flutter/material.dart';

enum UpdateInformationType {
  phone,
  email,
  firstName,
  middleName, // tên đệm
  lastName,
  fullName,
  nickName,
  gender,
  birthDay,
  expiryDate,
  supplyDate,
  protector, // người bảo hộ
  pDoneID, // id Pdone.
  country, // quốc gia
  province, // tỉnh thành
  district,
  ward,
  address,
  street,
  idNumber, // CCCD
  dateOfIdNumber, // ngày cấp
  placeofIdNumber, // nơi cấp
  height,
  weight,
  bloodType,
  maritalStatus,
  relationshipStatus,
  academicLevel,
  career,
  hobby,
  gifted,
  idBossTeamJA,
  idGroupJA,
  pDoneMethod,
  bank,
  bankNumber,
  bankAccountHolder,
  bossTeamId,
  nameAddress,
  receiverName,
  emailAndPhone,
  idNumberOfProtector,
  pDoneIDOfProtector,
  rateDiscount,
  discount,
  ageRange,
}

extension UpdateInformationTypeExt on UpdateInformationType {
  String title(BuildContext context) {
    switch (this) {
      case UpdateInformationType.firstName:
        return 'Họ';
      case UpdateInformationType.middleName:
        return 'Tên đệm';
      case UpdateInformationType.lastName:
        return 'Tên';
      case UpdateInformationType.fullName:
        return 'Họ và tên';
      case UpdateInformationType.nickName:
        return 'Nickname';
      case UpdateInformationType.gender:
        return 'Giới tính';
      case UpdateInformationType.birthDay:
        return 'Ngày tháng năm sinh';
      case UpdateInformationType.protector:
        return 'Người bảo hộ';
      case UpdateInformationType.pDoneID:
        return 'ID P-Done';
      case UpdateInformationType.country:
        return 'Quốc gia';
      case UpdateInformationType.province:
        return 'Tỉnh / thành';
      case UpdateInformationType.district:
        return 'Quận / huyện';
      case UpdateInformationType.ward:
        return 'Phường / xã';
      case UpdateInformationType.address:
        return 'Địa chỉ cụ thể';
      case UpdateInformationType.idNumber:
        return 'Số ID/CCCD/HC';
      case UpdateInformationType.dateOfIdNumber:
        return 'Ngày cấp';
      case UpdateInformationType.placeofIdNumber:
        return 'Nơi cấp';
      case UpdateInformationType.height:
        return 'Chiều cao';
      case UpdateInformationType.weight:
        return 'Cân nặng';
      case UpdateInformationType.bloodType:
        return 'Nhóm máu';
      case UpdateInformationType.relationshipStatus:
        return 'Tình trạng hôn nhân';
      case UpdateInformationType.academicLevel:
        return 'Học vấn hiện tại';
      case UpdateInformationType.career:
        return 'Nghề nghiệp';
      case UpdateInformationType.hobby:
        return 'Sở thích';
      case UpdateInformationType.gifted:
        return 'Năng khiếu';
      case UpdateInformationType.email:
        return 'Email';
      case UpdateInformationType.phone:
        return 'Số điện thoại';
      case UpdateInformationType.idBossTeamJA:
        return 'ID Team';
      case UpdateInformationType.idGroupJA:
        return 'ID Group';
      case UpdateInformationType.bank:
        return 'Ngân hàng';
      case UpdateInformationType.bankNumber:
        return 'Số tài khoản';
      case UpdateInformationType.bankAccountHolder:
        return 'Tên chủ tài khoản';
      case UpdateInformationType.bossTeamId:
        return 'ID Boss Team';
      case UpdateInformationType.nameAddress:
        return 'Tên địa điểm';
      case UpdateInformationType.receiverName:
        return 'Tên người nhận';
      case UpdateInformationType.emailAndPhone:
        return 'Số điện thoại/Email';
      case UpdateInformationType.rateDiscount:
        return 'Theo %';
      case UpdateInformationType.discount:
        return 'Quy đổi thành số tiền';
      case UpdateInformationType.idNumberOfProtector:
        return 'Số ID/CCCD/HC';
      case UpdateInformationType.pDoneIDOfProtector:
        return 'ID P-Done của người bảo hộ';
      case UpdateInformationType.street:
        return 'Đường/thôn';
      case UpdateInformationType.maritalStatus:
        return 'Tình trạng hôn nhân';
      case UpdateInformationType.expiryDate:
        return 'Ngày hết hạn thẻ';
      case UpdateInformationType.supplyDate:
        return 'Ngày cấp thẻ';
      case UpdateInformationType.ageRange:
       return 'Chọn độ tuổi của bạn';
      case UpdateInformationType.pDoneMethod:
        return 'Chọn phương thức';
    }
  }

  String hintText() {
    switch (this) {
      case UpdateInformationType.phone:
        return 'Nhập số điện thoại';
      case UpdateInformationType.email:
        return 'Nhập email';
      case UpdateInformationType.firstName:
        return 'Nhập họ';
      case UpdateInformationType.middleName:
        return 'Nhập tên đệm';
      case UpdateInformationType.lastName:
        return 'Nhập tên';
      case UpdateInformationType.fullName:
        return 'Nhập họ và tên';
      case UpdateInformationType.nickName:
        return 'Nhập nickname';
      case UpdateInformationType.gender:
        return 'Chọn giới tính';
      case UpdateInformationType.birthDay:
        return 'Chọn ngày sinh';
      case UpdateInformationType.protector:
        return 'Chọn người bảo hộ';
      case UpdateInformationType.pDoneID:
        return 'Nhập ID P-Done';
      case UpdateInformationType.country:
        return 'Chọn quốc gia';
      case UpdateInformationType.province:
        return 'Chọn tỉnh/thành';
      case UpdateInformationType.district:
        return 'Chọn quận/huyện';
      case UpdateInformationType.ward:
        return 'Chọn phường/xã';
      case UpdateInformationType.address:
        return 'Nhập địa chỉ';
      case UpdateInformationType.idNumber:
        return 'Nhập số ID/CCCD/HC';
      case UpdateInformationType.dateOfIdNumber:
        return 'Chọn ngày cấp';
      case UpdateInformationType.placeofIdNumber:
        return 'Nhập nơi cấp';
      case UpdateInformationType.height:
        return 'Nhập chiều cao ';
      case UpdateInformationType.weight:
        return 'Nhập cân nặng';
      case UpdateInformationType.bloodType:
        return 'Chọn nhóm máu ';
      case UpdateInformationType.relationshipStatus:
        return 'Chọn tình trạng hôn nhân';
      case UpdateInformationType.academicLevel:
        return 'Chọn học vấn hiện tại';
      case UpdateInformationType.career:
        return 'Chọn nghề nghiệp';
      case UpdateInformationType.hobby:
        return 'Chọn sở thích';
      case UpdateInformationType.gifted:
        return 'Chọn loại năng khiếu';
      case UpdateInformationType.idBossTeamJA:
        return 'Nhập ID Team';
      case UpdateInformationType.idGroupJA:
        return 'Nhập ID Group';
      case UpdateInformationType.bank:
        return 'Chọn ngân hàng';
      case UpdateInformationType.bankNumber:
        return 'Nhập số tài khoản';
      case UpdateInformationType.bankAccountHolder:
        return 'Nhập tên chủ tài khoản';
      case UpdateInformationType.bossTeamId:
        return 'Nhập ID Boss Team';
      case UpdateInformationType.nameAddress:
        return 'Nhập tên địa điểm';
      case UpdateInformationType.receiverName:
        return 'Nhập tên người nhận';
      case UpdateInformationType.emailAndPhone:
        return 'Nhập SĐT/Email của người bảo hộ';
      case UpdateInformationType.rateDiscount:
        return 'Nhập % giảm giá';
      case UpdateInformationType.discount:
        return 'Mức giảm';
      case UpdateInformationType.idNumberOfProtector:
        return 'Nhập số ID/CCCD/HC của người bảo hộ';
      case UpdateInformationType.pDoneIDOfProtector:
        return 'Nhập ID P-Done của người bảo hộ';
      case UpdateInformationType.street:
        return 'Nhập đường/thôn';
      case UpdateInformationType.maritalStatus:
        return 'Tình trạng hôn nhân';
      case UpdateInformationType.expiryDate:
        return 'Ngày hết hạn thẻ';
      case UpdateInformationType.supplyDate:
        return 'Ngày cấp thẻ';
      case UpdateInformationType.ageRange:
        return 'Độ tuổi';
      case UpdateInformationType.pDoneMethod:
        return 'Chọn phương thức';
    }
  }
}
