import 'package:app_core/app_core.dart';
import 'package:intl/intl.dart' as la;

extension DateTimeWalletExt on DateTime {
  String toDDMMYYYYHHMM() =>
      la.DateFormat('dd/mm/yyyy-HH:mm').format(toLocal());
}
