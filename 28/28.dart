import 'dart:io';

void main() {
  String inputText = stdin.readLineSync().toString();
  int n = int.parse(inputText.split(' ')[0]);
  int m = int.parse(inputText.split(' ')[1]);
  var twoDList =
      List.generate(n + 1, (i) => List.filled(m + 1, 0), growable: false);

  twoDList[1][1] = 1;
  for (int i = 2; i <= n; i++) {
    for (int j = 2; j <= m; j++) {
      twoDList[i][j] = twoDList[i - 1][j - 2] + twoDList[i - 2][j - 1];
    }
  }

  print(twoDList[n][m]);
}
