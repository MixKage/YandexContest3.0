import 'dart:io';

class MyCollection {
  int index = 0;
  int value = 0;
  int price = 0;
  MyCollection(this.index, this.value);
}

void comparison(List<int> list, List<MyCollection> collections) {
  int count = 0;
  int index = 0;
  for (var itemDiego in list) {
    bool isContainElement = true;
    while (isContainElement) {
      if (index == collections.length) {
        return;
      }

      if (collections[index].value <= itemDiego) {
        collections[index].price = count;
        index++;
      } else {
        isContainElement = false;
      }
    }
    count++;
  }
  for (int i = index; i < collections.length; i++) {
    collections[index++].price = count;
  }
}

void main() {
  int inputCount1 = int.parse(stdin.readLineSync().toString());
  List<int> input = stdin
      .readLineSync()
      .toString()
      .split(' ')
      .toList()
      .map(int.parse)
      .toList()
      .toSet()
      .toList();
  input.sort();
  int inputCount2 = int.parse(stdin.readLineSync().toString());
  List<int> input2 = stdin
      .readLineSync()
      .toString()
      .split(' ')
      .toList()
      .map(int.parse)
      .toList();

  List<MyCollection> collections = [];
  int tmpIndex = 0;
  for (var item in input2) {
    collections.add(MyCollection(tmpIndex++, item));
  }

  collections.sort(
    (a, b) => a.value.compareTo(b.value),
  );

  // Сравниваем два листа и выполняем поставленную задачу
  comparison(input, collections);

  collections.sort(
    (a, b) => a.index.compareTo(b.index),
  );

  for (var item in collections) {
    print(item.price);
  }
}
