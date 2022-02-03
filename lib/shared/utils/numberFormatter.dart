import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class NumberFormater {
  String currencyFormatter(double number) {
    final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(number);
  }

  String dateFormatter(DateTime date) {
    initializeDateFormatting("pt_br");
    final formatter = DateFormat("MMMMd", "pt_br");
    return formatter.format(date);
  }
}
