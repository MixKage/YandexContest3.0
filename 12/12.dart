import 'dart:io';

bool isGoodQueue(List<String> input) {
  List<String> stack = [];
  for (var item in input) {
    if (item == ')') {
      if (stack.isEmpty) return false;
      if (stack.last != '(') return false;
      stack.removeLast();
    } else if (item == ']') {
      if (stack.isEmpty) return false;
      if (stack.last != '[') return false;
      stack.removeLast();
    } else if (item == '}') {
      if (stack.isEmpty) return false;
      if (stack.last != '{') return false;
      stack.removeLast();
    } else {
      stack.add(item);
    }
  }
  return stack.isEmpty;
}

void main() {
  List<String> input = stdin.readLineSync().toString().split('').toList();
  if (input.length % 2 != 0) {
    print('no');
    return;
  }
  print(isGoodQueue(input) ? 'yes' : 'no');
}
