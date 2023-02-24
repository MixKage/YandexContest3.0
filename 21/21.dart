// https://site.ada.edu.az/~medv/acm/Docs%20e-olimp/Volume%203/263.htm
import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync().toString());
  List<int> dp = List<int>.filled(n + 4, 0, growable: false);
  dp[1] = 2;
  dp[2] = 4;
  dp[3] = 7;

  for (int i = 4; i <= n; i++) {
    dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]);
  }
  print(dp[n]);
}
