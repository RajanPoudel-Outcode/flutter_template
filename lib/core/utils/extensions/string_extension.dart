import 'package:intl/intl.dart';

extension StringExtension on String {
  String toReadableDate() {
    final date = DateTime.parse(this);
    final formatted = DateFormat('MMMM d, yyyy').format(date);
    return formatted;
  }

  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
