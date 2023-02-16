import 'dart:io';

class Char {
  String char;
  int count = 1;
  int ascii = 0;

  Char(this.char, this.ascii);
}

void deleteElement(List<Char> list) {
  int index = 0;
  if (list[0].ascii == 10 || list[0].ascii == 32) {
    index++;
  }
  if (list[1].ascii == 10 || list[1].ascii == 32) {
    index++;
  }
  list.removeRange(0, index);
}

void addToList(List<Char> list, int newValue) {
  bool isContains = true;
  for (var item in list) {
    if (item.ascii == newValue) {
      item.count++;
      isContains = false;
    }
  }
  if (isContains) list.add(Char(String.fromCharCode(newValue), newValue));
}

void bubbleSort(List<Char> list) {
  Char temp;
  for (int i = 0; i < list.length - 1; i++) {
    for (int j = 0; j < list.length - i - 1; j++) {
      if (list[j + 1].ascii < list[j].ascii) {
        temp = list[j + 1];
        list[j + 1] = list[j];
        list[j] = temp;
      }
    }
  }
}

int maxCount(List<Char> list) {
  int maxCount = 0;
  for (var item in list) {
    if (maxCount < item.count) maxCount = item.count;
  }
  return maxCount;
}

Future<void> main() async {
  var file = File('input.txt');
  String input = file.readAsStringSync();

  if (input == null) {
    return;
  }

  List<Char> listChars = [];
  input.codeUnits.forEach((element) {
    addToList(listChars, element);
  });

  // Сортируем пузырьком
  bubbleSort(listChars);

  // Удаляем проблем и перенос строки
  deleteElement(listChars);

  // Строим гистограмму
  List<String> outputs = [];
  int maxLength = maxCount(listChars);
  for (int i = 0; i <= maxLength; i++) {
    String tmp = '';
    if (i == 0) {
      for (var item in listChars) {
        tmp += item.char;
      }
    } else {
      for (var item in listChars) {
        if (i <= item.count) {
          tmp += '#';
        } else {
          tmp += ' ';
        }
      }
    }
    outputs.add(tmp);
  }

  for (int i = outputs.length - 1; i >= 0; i--) {
    print(outputs[i]);
  }
}
