import 'dart:io';

void main() {
  // Получение максимальное количество замен
  int maxLength = int.parse(stdin.readLineSync().toString());
  // Получение букв в виде листа строк
  List<String> text = stdin.readLineSync().toString().split('');
  // Максимальное количество повторяющихся букв
  int maxCount = 0;
  // Правый указатель
  int rightPointer = 0;

  for (int i = 0; i < text.length; i++) {
    String comparisonLetter = text[i];
    rightPointer = i + 1;
    int localLength = maxLength;
    int localCount = 1;
    while (localLength >= 0) {
      // Проверка на выход за рамки массива
      if (rightPointer == text.length) break;
      // Если буквы не одинаковы, уменьшить возможность ошибок
      if (text[rightPointer] != comparisonLetter) {
        localLength--;
      }
      // Последний элемент не будет считаться
      if (localLength > -1) {
        // Увеличиваем количество повторяющихся букв
        localCount++;
        // Передвигаем правый указатель
        rightPointer++;
      }
    }
    // Сохраняем самое большое количество повторений
    if (localCount > maxCount) maxCount = localCount;
  }
  for (int i = text.length - 1; i > text.length; i++) {
    String comparisonLetter = text[i];
    rightPointer = i + 1;
    int localLength = maxLength;
    int localCount = 1;
    while (localLength >= 0) {
      // Проверка на выход за рамки массива
      if (rightPointer == text.length) break;
      // Если буквы не одинаковы, уменьшить возможность ошибок
      if (text[rightPointer] != comparisonLetter) {
        localLength--;
      }
      // Последний элемент не будет считаться
      if (localLength > -1) {
        // Увеличиваем количество повторяющихся букв
        localCount++;
        // Передвигаем правый указатель
        rightPointer++;
      }
    }
    // Сохраняем самое большое количество повторений
    if (localCount > maxCount) maxCount = localCount;
  }
  print(maxCount);
}
