// a<=d and c<=b
import 'dart:io';

extension ListOperationSystem on List<OperationSystem> {
  int countAliveOs() {
    int count = 0;
    for (var os in this) {
      if (os.isAlive) count++;
    }
    return count;
  }
}

class OperationSystem {
  int startMem;
  int endMem;
  bool isAlive = true;
  OperationSystem(this.startMem, this.endMem);
}

void main() {
  List<OperationSystem> listOs = [];
  int maxLength = int.parse(stdin.readLineSync().toString());
  int countSectors = int.parse(stdin.readLineSync().toString());

  for (int i = 0; i < countSectors; i++) {
    String input = stdin.readLineSync().toString();
    int startMem = int.parse(input.split(' ')[0]);
    int endMem = int.parse(input.split(' ')[1]);
    for (var os in listOs) {
      // Если новая операционная система задевает живую предыдущю
      if (os.isAlive && startMem <= os.endMem && os.startMem <= endMem) {
        os.isAlive = false;
      }
    }
    listOs.add(OperationSystem(startMem, endMem));
  }
  print(listOs.countAliveOs());
}
