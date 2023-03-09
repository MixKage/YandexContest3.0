import 'dart:io';

final File inputFile = File('input.txt');
final File outputFile = File('output.txt');

List<String> _loadFile() => inputFile.readAsLinesSync();

void _dropOutputFile() =>
    outputFile.existsSync() ? outputFile.deleteSync() : null;

void _saveLineToFile(String line) =>
    outputFile.writeAsStringSync("$line\n", mode: FileMode.append);

void main() {
  List<String> input = _loadFile();
  _dropOutputFile();
  int n = int.parse(input[0].split(' ')[0]);
  int m = int.parse(input[0].split(' ')[1]);
  int request = int.parse(input[0].split(' ')[2]);
  var twoDList = List.generate(n, (i) => List.filled(m, 0), growable: false);
  var twoDListLine =
      List.generate(n, (i) => List.filled(m, 0), growable: false);
  var twoDListRequest =
      List.generate(request, (i) => List.filled(4, 0), growable: false);
  int index = 1;
  for (int i = 0; i < n; i++) {
    twoDListLine[i] = input[index++].trim().split(' ').map(int.parse).toList();
  }

  for (int i = 0; i < request; i++) {
    twoDListRequest[i] =
        input[index++].trim().split(' ').map(int.parse).toList();
  }

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if (j == 0) {
        twoDList[i][j] = twoDListLine[i][j];
      } else {
        twoDList[i][j] = twoDListLine[i][j] + twoDList[i][j - 1];
      }
    }
  }

  for (int i = 0; i < request; i++) {
    int answer = 0;
    int startX = twoDListRequest[i][1] - 1;
    int startY = twoDListRequest[i][0] - 1;
    int endX = twoDListRequest[i][3] - 1;
    int endY = twoDListRequest[i][2] - 1;
    for (int j = startY; j <= endY; j++) {
      if (startX == endX && startY == endY) {
        answer += twoDListLine[startY][startX];
      } else if (startX == 0) {
        answer += twoDList[j][endX];
      } else if (endX == startX) {
        answer += twoDListLine[j][startX];
      } else {
        answer += twoDList[j][endX] - twoDList[j][startX - 1];
      }
    }
    _saveLineToFile(answer.toString());
  }
}
