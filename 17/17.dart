// 0 бьёт только 9

import 'dart:collection';
import 'dart:io';

final File inputFile = File('input.txt');
final File outputFile = File('output.txt');

List<String> _loadFile() => inputFile.readAsLinesSync();

void _dropOutputFile() =>
    outputFile.existsSync() ? outputFile.deleteSync() : null;

void _saveLineToFile(String line) =>
    outputFile.writeAsStringSync("$line\n", mode: FileMode.append);

void main() {
  List<String> textFile = _loadFile();
  _dropOutputFile();
  Queue<int> firstPerson = Queue<int>();
  Queue<int> secondPerson = Queue<int>();

  for (int i = 0; i < 10; i++) {
    int tmpInput = 0;
    if (i < 5) {
      tmpInput = int.parse(textFile[0].split(' ')[i]);
      firstPerson.addLast(tmpInput);
    } else {
      tmpInput = int.parse(textFile[1].split(' ')[i - 5]);
      secondPerson.addLast(tmpInput);
    }
  }

  int countMove = 0;
  bool botva = false;
  while (firstPerson.isNotEmpty && secondPerson.isNotEmpty) {
    countMove++;
    if (firstPerson.first != 0 && secondPerson.first != 0) {
      if (firstPerson.first > secondPerson.first) {
        firstPerson.addLast(firstPerson.removeFirst());
        firstPerson.addLast(secondPerson.removeFirst());
      } else {
        secondPerson.addLast(firstPerson.removeFirst());
        secondPerson.addLast(secondPerson.removeFirst());
      }
    } else {
      if (firstPerson.first == 0) {
        if (secondPerson.first == 9) {
          firstPerson.addLast(firstPerson.removeFirst());
          firstPerson.addLast(secondPerson.removeFirst());
        } else {
          secondPerson.addLast(firstPerson.removeFirst());
          secondPerson.addLast(secondPerson.removeFirst());
        }
      } else {
        if (firstPerson.first == 9) {
          secondPerson.addLast(firstPerson.removeFirst());
          secondPerson.addLast(secondPerson.removeFirst());
        } else {
          firstPerson.addLast(firstPerson.removeFirst());
          firstPerson.addLast(secondPerson.removeFirst());
        }
      }
    }

    if (countMove > 1000000) {
      botva = true;
      break;
    }
  }
  String answer = '';
  if (botva) {
    answer = 'botva';
  } else {
    answer =
        (firstPerson.isEmpty ? 'second ' : 'first ') + countMove.toString();
  }
  _saveLineToFile(answer);
}
