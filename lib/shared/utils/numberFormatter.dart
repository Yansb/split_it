import "package:intl/intl.dart";

class NumberFormater {
  String currencyFormatter(double number) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return formatter.format(number);
  }

  String dateFormatter(DateTime date) {
    final formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(date);
  }
}
