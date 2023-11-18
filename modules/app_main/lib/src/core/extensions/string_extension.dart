import 'dart:convert';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  Map<String, dynamic> toMap() {
    try {
      return jsonDecode(this);
    } on Exception {
      final input = replaceAll('{', '').replaceAll('}', '');
      final arr = input.split(',').map((e) => e.trim()).toList();
      final output = <String, dynamic>{};
      for (final String element in arr) {
        final key = element.split('=')[0];
        final val = element.split('=')[1];
        output[key] = val;
      }
      return output;
    }
  }
}
