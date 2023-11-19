import 'package:pdf/widgets.dart';

import '../ui_model/contract_ui_model.dart';
import '../ui_model/default_textstyle.dart';

class ContactPointInformationWidget extends StatelessWidget {
  ContactPointInformationWidget({
    required this.index,
    required this.model,
  }) : super();

  final int index;
  final ContactPointInformationUIModel model;

  @override
  Widget build(Context context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Text('${index + 1}.', style: defaultTextStyle),
        ),
        Spacer(),
        Flexible(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              ...model.contents.map(
                    (e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ContactPointInformationRowWidget(model: e),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    model.footer,
                    style: defaultTextStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactPointInformationRowWidget extends StatelessWidget {
  ContactPointInformationRowWidget({
    required this.model,
  }) : super();

  final ContactPointInformationRowUIModel model;

  @override
  Widget build(Context context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Text(model.title, style: defaultTextStyle),
        ),
        Flexible(
          child: Text(':   '),
        ),
        Expanded(
          flex: 15,
          child: RichText(text: model.value),
        ),
      ],
    );
  }
}
