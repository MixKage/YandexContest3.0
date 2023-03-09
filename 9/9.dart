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
  var listLines = List.generate(n, (i) => List.filled(m, 0), growable: false);

  var prefixSum2D =
      List.generate(n + 1, (i) => List.filled(m + 1, 0), growable: false);

  var twoDListRequest =
      List.generate(request, (i) => List.filled(4, 0), growable: false);

  int index = 1;
  for (int i = 0; i < n; i++) {
    listLines[i] = input[index++].trim().split(' ').map(int.parse).toList();
  }

  for (int i = 0; i < request; i++) {
    twoDListRequest[i] =
        input[index++].trim().split(' ').map(int.parse).toList();
  }

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      prefixSum2D[i + 1][j + 1] = prefixSum2D[i][j + 1] +
          prefixSum2D[i + 1][j] -
          prefixSum2D[i][j] +
          listLines[i][j];
    }
  }
  //
  // Печать матрицы для дебага
  // String text = '';
  // for (int j = 0; j <= m; j++) {
  //   for (int i = 0; i <= n; i++) {
  //     text += '${prefixSum2D[j][i]}\t';
  //   }
  //   print(text);
  //   text = '';
  // }

  for (int i = 0; i < twoDListRequest.length; i++) {
    int startX = twoDListRequest[i][0];
    int startY = twoDListRequest[i][1];
    int endX = twoDListRequest[i][2];
    int endY = twoDListRequest[i][3];
    _saveLineToFile((prefixSum2D[endX][endY] -
            prefixSum2D[startX - 1][endY] -
            prefixSum2D[endX][startY - 1] +
            prefixSum2D[startX - 1][startY - 1])
        .toString());
  }
}
