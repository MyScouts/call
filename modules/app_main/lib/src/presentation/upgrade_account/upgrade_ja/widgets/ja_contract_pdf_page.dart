import 'dart:typed_data';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/ui_model/ja_contract_content_ui_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../ui_model/contact_information_content.dart';
import '../ui_model/default_textstyle.dart';
import '../ui_model/rule_content.dart';
import 'ja_contract_contact_point_information_widget.dart';
import 'ja_contract_rule_information_widget.dart';

class JAContractPdfPage {
  JAContractPdfPage(this.model) : super();

  final JAContractContentUIModel model;

  Future<Uint8List> buildPdf(
    PdfPageFormat pageFormat,
  ) async {
    final document = Document();

    document.addPage(
      MultiPage(
        pageTheme: PageTheme(
          margin: const EdgeInsets.all(16),
          pageFormat: pageFormat,
          orientation: PageOrientation.portrait,
          theme: ThemeData.withFont(
            base: await PdfGoogleFonts.robotoRegular(),
            bold: await PdfGoogleFonts.robotoBold(),
            italic: await PdfGoogleFonts.robotoItalic(),
            boldItalic: await PdfGoogleFonts.robotoBoldItalic(),
          ),
        ),
        build: (context) => [
          _header(),
          SizedBox(height: 18),
          _title(),
          SizedBox(height: 12),
          _contactInformationDescription(),
          SizedBox(height: 12),
          ..._contactInformation(),
          SizedBox(height: 12),
          _ruleDescription(),
          SizedBox(height: 12),
          ..._ruleInformation(),
          SizedBox(height: 12),
          _signature(),
        ]
            .map(
              (e) => Container(
                margin: const EdgeInsets.only(right: 16),
                child: e,
              ),
            )
            .toList(),
      ),
    );

    return document.save();
  }

  Widget _header() {
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
              Text('....'),
              Text(
                '${model.jaContractNumber}/2022/HĐCTV-\nVIPTAM',
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

  Widget _title() {
    return Center(
      child: Text(
        'HỢP ĐỒNG CỘNG TÁC VIÊN',
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _contactInformationDescription() {
    return Text(
      'Hôm nay, ngày ${DateTime.now().day} tháng ${DateTime.now().month} năm ${DateTime.now().year}, tại trụ sở chính của Công ty cổ phần tập đoàn công nghệ Viptam chúng tôi gồm:',
      style: defaultTextStyle,
    );
  }

  List<Widget> _contactInformation() {
    return getContactPointInformation(model)
        .mapIndexed(
          (index, model) => ContactPointInformationWidget(index: index, model: model),
        )
        .toList();
  }

  Widget _ruleDescription() {
    return RichText(
      text: TextSpan(
        style: defaultTextStyle,
        children: [
          const TextSpan(
            text: 'Sau khi thảo luận các bên đồng ý ký kết Hợp đồng cộng tác viên (gọi tắt là ',
          ),
          TextSpan(
            text: '“Hợp Đồng"',
            style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: ') với các điều khoản và điều kiện như sau:',
          )
        ],
      ),
    );
  }

  List<Widget> _ruleInformation() {
    return getRuleInformation()
        .mapIndexed(
          (index, model) => Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: RuleInformationWidget(index: index, model: model),
          ),
        )
        .toList();
  }

  Widget _signature() {
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
              Text(model.user.getdisplayName, style: defaultTextStyle),
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
