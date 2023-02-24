// https://site.ada.edu.az/~medv/acm/Docs%20e-olimp/Volume%2010/987.htm
import 'dart:io';
import 'dart:math';

void main() {
  int n = int.parse(stdin.readLineSync().toString());
  List<int> dp = List<int>.filled(101, 0, growable: false);
  List<String> inputText =
      stdin.readLineSync().toString().trim().split(' ').toList();
  List<int> array = [];
  array.add(0);
  for (int i = 1; i <= n; i++) {
    array.add(int.parse(inputText[i - 1]));
  }
  array.sort();

  while (array.length < 4) {
    array.add(0);
  }

  dp[2] = array[2] - array[1];
  dp[3] = array[3] - array[1];
  for (int i = 4; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + array[i] - array[i - 1];
  }
  print(dp[n]);
}
