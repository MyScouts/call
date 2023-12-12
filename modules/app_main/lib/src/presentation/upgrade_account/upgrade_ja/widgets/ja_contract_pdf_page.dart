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

part 'ja_contract_pdf_page_header.dart';
part 'ja_contract_pdf_page_title.dart';
part 'ja_contract_pdf_page_contact_information_description.dart';
part 'ja_contract_pdf_page_rule_description.dart';
part 'ja_contract_pdf_page_signature.dart';

class JAContractPdfPage {
  JAContractPdfPage(this.model) : super();

  final JAContractContentUIModel model;

  Future<Uint8List> buildPdf(
    PdfPageFormat pageFormat,
  ) async {
    final document = Document();

    document.addPage(
      MultiPage(
        footer: (context) => Center(child: Text(context.pageNumber.toString())),
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
          _Header(model: model),
          SizedBox(height: 18),
          _Title(),
          SizedBox(height: 12),
          _ContactInformationDescription(),
          SizedBox(height: 12),
          ..._contactInformation(),
          SizedBox(height: 12),
          _RuleDescription(),
          SizedBox(height: 12),
          ..._ruleInformation(),
          SizedBox(height: 12),
          _Signature(model: model),
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

  List<Widget> _contactInformation() {
    return getContactPointInformation(model)
        .mapIndexed(
          (index, model) => ContactPointInformationWidget(index: index, model: model),
        )
        .toList();
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
}
