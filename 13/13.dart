// by meg4cyberc4t
import 'dart:io';

void main() {
  List<String> input = stdin.readLineSync().toString().split(' ');
  List<int> values = [];

  Map<String, int Function(int, int)> mathOperators = {
    "+": (p0, p1) => p0 + p1,
    "-": (p0, p1) => p0 - p1,
    "*": (p0, p1) => p0 * p1,
  };

  for (var elem in input) {
    if (mathOperators.containsKey(elem)) {
      int preLast = values.removeLast();
      int last = values.removeLast();
      values.add(mathOperators[elem]!(last, preLast));
    } else {
      values.add(int.parse(elem));
    }
  }
  
  print(values.last.toString());
}
