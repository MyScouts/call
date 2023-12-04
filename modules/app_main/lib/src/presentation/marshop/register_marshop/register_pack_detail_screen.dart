import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ui/ui.dart';

class RegisterPackDetailRule {
  final MarshopRegisterPackRule rule;
  bool isExpanded;

  RegisterPackDetailRule({this.isExpanded = false, required this.rule});
}

class RegisterPackDetailScreen extends StatefulWidget {
  static const String routeName = 'register-pack-detail';
  final MarshopRegisterPackResponse pack;
  const RegisterPackDetailScreen({
    super.key,
    required this.pack,
  });

  @override
  State<RegisterPackDetailScreen> createState() =>
      _RegisterPackDetailScreenState();
}

class _RegisterPackDetailScreenState extends State<RegisterPackDetailScreen> {
  List<RegisterPackDetailRule> rules = [];

  @override
  void initState() {
    super.initState();
    for (var element in widget.pack.rules) {
      rules.add(RegisterPackDetailRule(rule: element));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: widget.pack.name,
          isClose: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: ListView.builder(
            itemCount: rules.length,
            itemBuilder: (BuildContext context, int index) {
              final rule = rules[index].rule;
              return ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.zero,
                animationDuration: const Duration(milliseconds: 1000),
                elevation: 0,
                children: [
                  ExpansionPanel(
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Html(
                          data: rule.content,
                        ),
                      ],
                    ),
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Assets.icons_shape_check_success.image(width: 20),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                "${rule.title} (SL: ${rule.quantity})",
                                style: context.text.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    isExpanded: rules[index].isExpanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  rules[index].isExpanded = !rules[index].isExpanded;
                  setState(() {});
                },
              );
            },
          ),
        ));
  }
}
