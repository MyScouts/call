part of 'ja_contract_pdf_page.dart';

class _RuleDescription extends StatelessWidget {
  _RuleDescription();

  @override
  Widget build(Context context) {
    return RichText(
      text: TextSpan(
        style: defaultTextStyle,
        children: [
          const TextSpan(
            text: 'Sau khi thảo luận các bên đồng ý ký kết Hợp đồng cộng tác viên (gọi tắt là ',
          ),
          TextSpan(
            text: '“Hợp Đồng JA"',
            style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: '") với các điều khoản và điều kiện như dưới đây, các thuật ngữ trong Hợp Đồng JA này được hiểu thống nhất theo quy định trên nền tảng VDONE thuộc quyền sở hữu của Bên A tại từng thời điểm:',
          )
        ],
      ),
    );
  }
}

