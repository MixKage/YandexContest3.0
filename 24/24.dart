// https://site.ada.edu.az/~medv/acm/Docs%20e-olimp/Volume%208/799.htm

import 'dart:io';
import 'dart:math';

int myMin(int a, int b, int c) {
  return min(min(a, b), c);
}

void main() {
  List<int> a = [];
  List<int> b = [];
  List<int> c = [];
  List<int> t = [];

  int n = int.parse(stdin.readLineSync().toString());
  for (int i = 0; i < n; i++) {
    String textInput = stdin.readLineSync().toString();
    a.add(int.parse(textInput.trim().split(' ')[0]));
    b.add(int.parse(textInput.trim().split(' ')[1]));
    c.add(int.parse(textInput.trim().split(' ')[2]));
  }
  while (a.length < 2) {
    a.add(0);
  }
  t.add(0);
  t.add(a[0]);
  t.add(min(a[0] + a[1], b[0]));
  for (int i = 2; i < n; i++) {
    t.add(myMin(t[i] + a[i], t[i - 1] + b[i - 1], t[i - 2] + c[i - 2]));
  }
  print(t[n]);
}
