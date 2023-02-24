import 'dart:io';

void main() {
  List<int> dp = List<int>.filled(31, 0, growable: false);

  String textInput = stdin.readLineSync().toString();
  int n = int.parse(textInput.split(' ')[0]);
  int k = int.parse(textInput.split(' ')[1]);

  int i;

  dp[1] = 1;
  dp[2] = 1;
  for (i = 3; i <= k; i++) {
    dp[i] = 2 * dp[i - 1];
  }

  for (; i <= n; i++) {
    dp[i] = 2 * dp[i - 1] - dp[i - k - 1];
  }
  print(dp[n]);
}
