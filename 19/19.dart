// https://www.kodeco.com/books/data-structures-algorithms-in-dart/v1.0/chapters/13-heaps
import 'dart:io';

enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  bool get isEmpty => elements.isEmpty;

  int get size => elements.length;

  E? get peek => (isEmpty) ? null : elements.first;

  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
  }

  late final List<E> elements;
  final Priority priority;

  @override
  String toString() => elements.toString();

  void insert(E value) {
    // 1
    elements.add(value);
    // 2
    _siftUp(elements.length - 1);
  }

  E? remove() {
    if (isEmpty) return null;
    // 1
    _swapValues(0, elements.length - 1);
    // 2
    final value = elements.removeLast();
    // 3
    _siftDown(0);
    return value;
  }

  void _siftUp(int index) {
    var child = index;
    var parent = _parentIndex(child);
    // 3
    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  void _siftDown(int index) {
    // 1
    var parent = index;
    while (true) {
      // 2
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      // 3
      var chosen = _higherPriority(left, parent);
      // 4
      chosen = _higherPriority(right, chosen);
      // 5
      if (chosen == parent) return;
      // 6
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);
    return (isFirst) ? indexA : indexB;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }
}

void main() {
  final heap = Heap<int>();
  int inputNum = 0;
  int countInput = int.parse(stdin.readLineSync().toString());
  for (int i = 0; i < countInput; i++) {
    // Блок ввода
    String inputText = stdin.readLineSync().toString();
    bool mode = inputText.split(' ')[0] == '1';
    if (!mode) {
      inputNum = int.parse(inputText.split(' ')[1]);
      heap.insert(inputNum);
    } else {
      print(heap.remove());
    }
  }
}
