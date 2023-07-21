extension IntExtension on int {
  /// Takken from julemand101 on stackoverflow.
  /// [url : https://stackoverflow.com/questions/60332689/how-do-i-make-an-integer-to-roman-algorithm-in-dart]
  String get romanNumber {
    if (this < 0) return "";
    if (this == 0) return "nulla";

    var num = this;

    final builder = StringBuffer();
    for (var a = 0; a < _arabianRomanNumbers.length; a++) {
      final times = (num / _arabianRomanNumbers[a]).truncate();
      builder.write(_romanNumbers[a] * times);
      num -= times * _arabianRomanNumbers[a];
    }

    return builder.toString();
  }
}

const List<int> _arabianRomanNumbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
const List<String> _romanNumbers = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
