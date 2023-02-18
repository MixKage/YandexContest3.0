import 'dart:io';

void main() {
  int count = int.parse(stdin.readLineSync().toString());
  int min_x = 2147483647;
  int max_x = -2147483647;
  int min_y = 2147483647;
  int max_y = -2147483647;

  for (int i = 0; i < count; i++) {
    String inputCord = stdin.readLineSync().toString();
    int x = int.parse(inputCord.split(' ')[0]);
    int y = int.parse(inputCord.split(' ')[1]);
    if (x > max_x) max_x = x;
    if (x < min_x) min_x = x;
    if (y > max_y) max_y = y;
    if (y < min_y) min_y = y;
  }
  print('$min_x $min_y $max_x $max_y');
}
