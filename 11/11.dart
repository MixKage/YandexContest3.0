import 'dart:io';

class MyStack {
  List<int> list = [];

  void push(String n) {
    list.add(int.parse(n));
    print('ok');
  }

  void pop() {
    try {
      print(list.last);
      list.removeLast();
    } catch (e) {
      print('error');
    }
  }

  void back() {
    try {
      print(list.last);
    } catch (e) {
      print('error');
    }
  }

  void size() {
    print(list.length);
  }

  void clear() {
    list.clear();
    print('ok');
  }

  void exit() {
    print('bye');
  }
}

void main() {
  MyStack myStack = MyStack();
  List<String> inputs = [];
  String tmpInput = '';
  while (tmpInput != 'exit') {
    tmpInput = stdin.readLineSync().toString();
    inputs.add(tmpInput);
  }
  for (var input in inputs) {
    switch (input) {
      case 'pop':
        myStack.pop();
        break;
      case 'back':
        myStack.back();
        break;
      case 'size':
        myStack.size();
        break;
      case 'clear':
        myStack.clear();
        break;
      case 'exit':
        myStack.exit();
        break;
    }
    if (input.contains('push')) {
      myStack.push(input.split(' ')[1]);
    }
  }
}
