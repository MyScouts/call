import 'package:flutter/material.dart';

class TextStaticContentWidget extends StatelessWidget {
  final List<Map<String, String>> contents;
  final Widget? title;

  const TextStaticContentWidget({
    super.key,
    this.title,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
          20, 10, 20, MediaQuery.of(context).padding.bottom + 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) title!,
          ...contents.map(
            (e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e['title'].toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF373737),
                    height: 1.6,
                  ),
                ),
                if (e['content'] != null)
                  Text(
                    e['content'].toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.8,
                        ),
                  ),
                if (e['red'] != null)
                  Text(
                    e['red'].toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.8,
                          color: Colors.red,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
