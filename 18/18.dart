import 'dart:collection';
import 'dart:io';

void main() {
  Queue<int> myQueue = Queue<int>();
  List<String> inputs = [];
  String tmpInput = '';
  while (tmpInput != 'exit') {
    tmpInput = stdin.readLineSync().toString();
    inputs.add(tmpInput);
  }
  for (var input in inputs) {
    switch (input) {
      case 'pop_front':
        if (myQueue.isEmpty) {
          print('error');
        } else {
          print(myQueue.removeFirst());
        }
        break;
      case 'pop_back':
        if (myQueue.isEmpty) {
          print('error');
        } else {
          print(myQueue.removeLast());
        }
        break;
      case 'front':
        if (myQueue.isEmpty) {
          print('error');
        } else {
          print(myQueue.first);
        }
        break;
      case 'back':
        if (myQueue.isEmpty) {
          print('error');
        } else {
          print(myQueue.last);
        }
        break;
      case 'size':
        print(myQueue.length);
        break;
      case 'clear':
        myQueue.clear();
        print('ok');
        break;
      case 'exit':
        print('bye');
        break;
    }
    if (input.contains('push_front')) {
      myQueue.addFirst(int.parse(input.split(' ')[1]));
      print('ok');
    } else if (input.contains('push_back')) {
      myQueue.addLast(int.parse(input.split(' ')[1]));
      print('ok');
    }
  }
}
