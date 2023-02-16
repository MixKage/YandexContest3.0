// By Meg4cyberc4t
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
  List<String> strings = _loadFile();
  _dropOutputFile();

  String input = strings.join().trim();

  final sortedSetValues = SplayTreeSet<String>(
    (entry1, entry2) => entry1.compareTo(entry2),
  );

  final Map<String, int> cached = {};
  int maxHeight = 0;

  for (int i = 0; i < input.length; i++) {
    final letter = input[i].trim();
    if (letter.trim().isEmpty) {
      continue;
    }
    sortedSetValues.add(letter);
    int newHeight = (cached[letter] ?? 0) + 1;
    cached[letter] = newHeight;
    if (maxHeight < newHeight) {
      maxHeight = newHeight;
    }
  }
  for (int i = maxHeight - 1; i >= 0; i--) {
    String out = "";
    for (var value in sortedSetValues) {
      out += (cached[value] == null || cached[value]! > i) ? "#" : " ";
    }
    _saveLineToFile(out);
  }
  _saveLineToFile(sortedSetValues.join());
}
