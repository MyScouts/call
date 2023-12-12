part of 'ja_contract_pdf_page.dart';

class _Signature extends StatelessWidget {
  _Signature({required this.model});

  final JAContractContentUIModel model;

  @override
  Widget build(Context context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'BÊN B',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(ký, ghi rõ họ tên)',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100),
              Text(
                model.pDoneInformationData?.fullName ?? '',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'ĐẠI DIỆN BÊN A',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(ký, ghi rõ họ tên, chức vụ, đóng dấu)',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100),
              Text(
                'Nguyễn Thanh Tuấn',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

