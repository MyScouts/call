import 'package:pdf/widgets.dart';

class ContactPointInformationUIModel {
  const ContactPointInformationUIModel({
    required this.title,
    required this.footer,
    required this.contents,
  });

  final String title;
  final String footer;
  final List<ContactPointInformationRowUIModel> contents;
}

class ContactPointInformationRowUIModel {
  const ContactPointInformationRowUIModel({required this.title, required this.value});

  final String title;
  final TextSpan value;
}

class RuleInformationUIModel {
  const RuleInformationUIModel({required this.title, this.description, required this.contents});

  final String title;
  final String? description;
  final List<RuleInformationRowUIModel> contents;
}

class RuleInformationRowUIModel {
  const RuleInformationRowUIModel({
    required this.content,
    this.bullet = ' -',
    this.style = RuleInformationRowLeadingStyle.bullet,
    this.nestedContents = const [],
  });

  final TextSpan content;
  final String bullet;
  final RuleInformationRowLeadingStyle style;
  final List<RuleInformationRowUIModel> nestedContents;
}

enum RuleInformationRowLeadingStyle { none, bullet, number, letter }
