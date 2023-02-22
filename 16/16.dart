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
      case 'pop':
        if (myQueue.isEmpty) {
          print('error');
        } else {
          print(myQueue.removeFirst());
        }
        break;
      case 'front':
        if (myQueue.isEmpty) {
          print('error');
        } else {
          print(myQueue.first);
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
    if (input.contains('push')) {
      myQueue.add(int.parse(input.split(' ')[1]));
      print('ok');
    }
  }
}
