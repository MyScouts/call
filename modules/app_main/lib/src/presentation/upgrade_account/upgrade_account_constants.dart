class UpgradeAccountConstants {
  static const int otpTimer = 60; // second
  static const int otpLen = 6;
  static const double horizontalScreen = 20.0; // second
}


class PDoneType {
  static const int unknown = 0;
  static const int child = 1;
  static const int childEKyc = 2;
  static const int teenager = 3;
  static const int adult = 4;
}

enum KycStep {
  verifyOtp,
  updateInformation,
  verifyIdentity,
  status,
}

abstract class UpgradePDoneMeta {
  static const imageBirthCer = "IMAGE_BIRTH_CER";
}

enum KycType {
  over15,
  under15idNumber,
  under15birthCertificate,
}

extension CitizenIdentificationExt on KycType {
  String text() {
    switch (this) {
      case KycType.over15:
        return 'Trên 15 căn cước công dân';
      case KycType.under15idNumber:
        return 'Dưới 15 căn cước công dân';
      case KycType.under15birthCertificate:
        return 'Dưới 15 giấy khai sinh';
    }
  }

  String description(bool isUnder14) {
    switch (this) {
      case KycType.over15:
        if (isUnder14) {
          return 'Xin vui lòng chụp ảnh 2 mặt của Căn cước công dân & '
              'chân dung của Người bảo hộ để hoàn tất hồ sơ.';
        }
        return 'Xin vui lòng chụp ảnh 2 mặt của Căn '
            'cước công dân & chân dung Quý khách để hoàn tất hồ sơ.';
      case KycType.under15idNumber:
        if (isUnder14) {
          return 'Xin vui lòng chụp ảnh trang thông tin Hộ chiếu & '
              'chân dung của Người bảo hộ Quý khách để hoàn tất hồ sơ.';
        }
        return 'Xin vui lòng chụp ảnh trang thông tin '
            'Hộ chiếu & chân dung Quý khách để hoàn tất hồ sơ.';
      case KycType.under15birthCertificate:
        if (isUnder14) {
          return 'Xin vui lòng chụp ảnh trang thông tin Hộ chiếu & '
              'chân dung của Người bảo hộ Quý khách để hoàn tất hồ sơ.';
        }
        return 'Xin vui lòng chụp ảnh giấy khai sinh '
            '& chân dung Quý khách để hoàn tất hồ sơ.';
    }
  }
}

const String textPolicyDemo = '''
VDONE tạo ra các công nghệ và dịch vụ nhằm hỗ trợ mọi người kết nối với nhau, xây dựng cộng đồng cũng như phát triển doanh nghiệp. Các Điều khoản này điều chỉnh việc bạn sử dụng các sản phẩm, tính năng, ứng dụng, dịch vụ, công nghệ cũng như phần mềm khác mà chúng tôi cung cấp (Sản phẩm của VDONE), trừ khi chúng tôi nêu rõ là áp dụng các điều khoản riêng (và không áp dụng các điều khoản này). Các Sản phẩm này do VipTam, Inc. cung cấp cho bạn. 
Bạn không mất phí sử dụng các sản phẩm và dịch vụ khác thuộc phạm vi điều chỉnh của những Điều khoản này, trừ khi chúng tôi có quy định khác. Thay vào đó, doanh nghiệp, tổ chức và những cá nhân khác sẽ phải trả tiền cho chúng tôi để hiển thị quảng cáo về sản phẩm và dịch vụ của họ cho bạn. Khi sử dụng Sản phẩm của chúng tôi, bạn đồng ý để chúng tôi hiển thị quảng cáo mà chúng tôi cho rằng có thể phù hợp với bạn và sở thích của bạn. Chúng tôi sử dụng dữ liệu cá nhân của bạn để xác định những quảng cáo được cá nhân hóa sẽ hiển thị cho bạn. 
Chúng tôi không bán dữ liệu cá nhân của bạn cho các nhà quảng cáo, cũng không Chia sẽ thông tin trực tiếp nhận dạng bạn (chẳng hạn như tên, địa chỉ email hoặc thông tin liên hệ khác) với những đơn vị này trừ khi được bạn cho phép cụ thể. Thay vào đó, các nhà quảng cáo có thể cho chúng tôi biết thông tin như kiểu đối tượng mà họ muốn nhìn thấy quảng cáo và chúng tôi có thể hiển thị những quảng cáo ấy cho người có thể quan
''';

enum ImageKYCType {
  kycIdentityFront,
  kycIdentityBack,
  portraitIdentity,
  kycPassport,
  portraitPassport,
}

const String securityInformation = '''
Toàn bộ thông tin cá nhân của Quý khách đều được P-Done đảm bảo an toàn bảo mật.
''';

enum JAStatus {
  pending(0),
  waitingForUserConfirmation(1),
  adminRejected(11),
  userRejected(12),
  accepted(10);

  const JAStatus(this.value);

  final num value;
}
