// import 'dart:io';
//
// void main() {
//   String inp = stdin.readLineSync().toString();
//   Map<String, int> counter = {};
//
//   void addLetterToCounter(String letter) =>
//       counter[letter] = (counter[letter] ?? 0) + 1;
//
//   for (int maxLength = 1; maxLength <= inp.length; maxLength++) {
//     int start = 0;
//     int end = start + maxLength;
//     while (end < inp.length) {
//       String subs = inp.substring(start, end);
//       for (var i = 0; i < subs.length; i++) {
//         addLetterToCounter(subs[i]);
//       }
//       start++;
//       end++;
//     }
//     String subs = inp.substring(start, end);
//     for (var i = 0; i < subs.length; i++) {
//       addLetterToCounter(subs[i]);
//     }
//   }
//   var answerList = counter.entries.toList();
//   answerList.sort((a, b) {
//     return a.key.compareTo(b.key);
//   });
//   for (var item in answerList) {
//     print('${item.key}: ${item.value}');
//   }
// }
//

//Реализация через алгоритм
import 'dart:io';

class Char {
  int ascii;
  int count = 0;
  Char(this.ascii);
}

extension BoringLecture on List<Char> {
  int _getCenterNum(int length) {
    if (length == 1) {
      return 1;
    } else if (length == 2) {
      return 2;
    }
    int answer = 2;
    int plus = 2;
    for (int i = 0; i < length - 2; i++) {
      if (i % 2 == 0 && i != 0) {
        plus++;
      }
      answer += plus;
    }
    return answer;
  }

  void _generateCount(List<int> list, int centerNum, bool isEven) {
    int countMinus = isEven ? 2 : 1;
    int center = centerNum - countMinus;
    for (int i = list.length - 1; i >= 0; i--) {
      list[i] = center;
      countMinus += 2;
      center -= countMinus;
    }
  }

  void boringLecture() {
    int length = this.length;
    bool isEven = length.isEven;
    // Создаём массив стоимости остальных элементов
    int count =
        isEven ? (length / 2).round() - 1 : ((length + 1) / 2).round() - 1;
    List<int> counters = List<int>.filled(count, 0, growable: false);

    // Получаем стоимость центрального элемента
    int centerNum = _getCenterNum(length);
    // Заполняем стоимость оставшихся элементов
    _generateCount(counters, centerNum, isEven);
    int centerIndex = count;

    for (int i = centerIndex; i >= 0; i--) {
      if (i == centerIndex) {
        this[i].count = centerNum;
        if (isEven) this[i + 1].count = centerNum;
      } else {
        this[i].count = counters[i];
        if (isEven) {
          this[centerIndex + 1 + (centerIndex - i)].count = counters[i];
        } else {
          this[centerIndex + (centerIndex - i)].count = counters[i];
        }
      }
    }
  }

  List<Char> deleteAllRepeats() {
    List<Char> answerList = [];
    bool newElement;
    for (var item in this) {
      newElement = true;
      for (var newItem in answerList) {
        if (newItem.ascii == item.ascii) {
          newElement = false;
          newItem.count += item.count;
          break;
        }
      }
      if (newElement) {
        answerList.add(item);
      }
    }
    return answerList;
  }

  void sortByAscii() {
    Char temp;
    for (int i = 0; i < length - 1; i++) {
      for (int j = 0; j < length - i - 1; j++) {
        if (this[j + 1].ascii < this[j].ascii) {
          temp = this[j + 1];
          this[j + 1] = this[j];
          this[j] = temp;
        }
      }
    }
  }
}

void main() {
  String input = stdin.readLineSync().toString();

  List<Char> chars = [];
  for (var item in input.codeUnits) {
    chars.add(Char(item));
  }
  chars.boringLecture();
  var newList = chars.deleteAllRepeats();
  newList.sortByAscii();
  for (var item in newList) {
    print('${String.fromCharCode(item.ascii)}: ${item.count}');
  }
}
