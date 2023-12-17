part of 'ja_contract_pdf_page.dart';

class _Header extends StatelessWidget {
  _Header({required this.model}): super();

  final JAContractContentUIModel model;

  @override
  Widget build(Context context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'CÔNG TY CỔ PHẦN TẬP\nĐOÀN CÔNG NGHỆ VIPTAM',
                textAlign: TextAlign.center,
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text('….....'),
              Text(
                'Số: ${model.jaContractNumber}/2022/HĐCTV-VIPTAM',
                textAlign: TextAlign.center,
                style: defaultTextStyle,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Độc lập - Tự do - Hạnh phúc',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

