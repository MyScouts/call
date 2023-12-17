import 'package:app_core/app_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../ui_model/contract_ui_model.dart';
import '../ui_model/default_textstyle.dart';

class RuleInformationWidget extends StatelessWidget {
  RuleInformationWidget({required this.index, required this.model}) : super();

  final int index;
  final RuleInformationUIModel model;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Điều ${index + 1}.    ${model.title}:',
          style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        if (model.description != null)
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4, left: 8),
            child: Text(
              '     ${model.description}',
              style: defaultTextStyle,
            ),
          ),
        SizedBox(height: 4),
        ...model.contents.mapIndexed(
          (index, element) => Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: RuleInformationRowWidget(ruleIndex: this.index, index: index, model: element),
          ),
        ),
      ],
    );
  }
}

class RuleInformationRowWidget extends StatelessWidget {
  RuleInformationRowWidget({
    required this.ruleIndex,
    required this.index,
    required this.model,
  }) : super();

  final int ruleIndex;
  final int index;
  final RuleInformationRowUIModel model;

  String _getLeadingText(RuleInformationRowUIModel model) => switch (model.style) {
        RuleInformationRowLeadingStyle.none => '${model.bullet}    ',
        RuleInformationRowLeadingStyle.bullet => '${model.bullet}   ',
        RuleInformationRowLeadingStyle.number => '${ruleIndex + 1}.${index + 1}. ',
        RuleInformationRowLeadingStyle.letter => '${model.content.text?.substring(0, 2) ?? ''}  ',
      };

  TextSpan _getContent(RuleInformationRowUIModel model) => switch (model.style) {
        RuleInformationRowLeadingStyle.letter =>
          TextSpan(text: model.content.text?.substring(2).trim(), style: model.content.style),
        _ => model.content,
      };

  TextStyle _getBulletStyle(RuleInformationRowUIModel model) => switch (model.style) {
        RuleInformationRowLeadingStyle.none => defaultTextStyle.copyWith(color: PdfColors.white),
        _ => defaultTextStyle,
      };

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_getLeadingText(model), style: _getBulletStyle(model)),
            SizedBox(width: 12),
            Expanded(
              flex: 15,
              child: RichText(text: model.content),
            ),
          ],
        ),
        SizedBox(height: 4),
        ...model.nestedContents.map(
          (element) => Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_getLeadingText(element), style: _getBulletStyle(element)),
                SizedBox(width: 12),
                Expanded(
                  flex: 15,
                  child: RichText(text: _getContent(element)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
