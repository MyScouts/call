import 'package:app_core/app_core.dart';
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
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(
                  '  ${model.description}',
                  style: defaultTextStyle,
                ),
              ],
            ),
          ),
        ...model.contents.mapIndexed(
              (index, element) => Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: RuleInformationRowWidget(index: index, model: element),
          ),
        ),
      ],
    );
  }
}

class RuleInformationRowWidget extends StatelessWidget {
  RuleInformationRowWidget({required this.index, required this.model}) : super();

  final int index;
  final RuleInformationRowUIModel model;

  String _getLeadingText(RuleInformationRowUIModel model) => switch (model.style) {
    RuleInformationRowLeadingStyle.number => '${index + 1}.',
    RuleInformationRowLeadingStyle.bullet => model.bullet,
  };

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_getLeadingText(model), style: defaultTextStyle),
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
                Text(_getLeadingText(element), style: defaultTextStyle),
                SizedBox(width: 12),
                Expanded(
                  flex: 15,
                  child: RichText(text: element.content),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
