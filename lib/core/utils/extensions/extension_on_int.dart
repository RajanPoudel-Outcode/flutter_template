//extension on pluralize on int

extension Pluralize on int {
  String pluralize(String singular) {
    if (this == 1) {
      return '1 $singular';
    }
    return '$this ${singular}s';
  }
}
