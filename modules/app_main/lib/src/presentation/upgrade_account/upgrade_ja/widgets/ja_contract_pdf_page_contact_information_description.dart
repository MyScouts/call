part of 'ja_contract_pdf_page.dart';

class _ContactInformationDescription extends StatelessWidget {
  _ContactInformationDescription();

  @override
  Widget build(Context context) {
    return Text(
      '                   Hôm nay, ngày ${DateTime.now().day} tháng ${DateTime.now().month} năm ${DateTime.now().year}, tại trụ sở chính của Công ty cổ phần tập đoàn công nghệ Viptam chúng tôi gồm:',
      style: defaultTextStyle,
    );
  }
}
