import 'AnalyzerResponse.dart';
import 'analyzer.dart';
import 'dart:io';

Future<void> main(List args) async {
  File file = File('input.txt');
  if (!(await file.exists())) {
    print("File Doesn't Exists");
    return;
  }
  String content = file.readAsStringSync();

  AnalyzerResponse res = Analyzer().analyze(content);

  print("Keywords: ${res.keywords}");
  print("Tables: ${res.tables}");
  print("Columns: ${res.columns}");
  print("Functions: ${res.functions}");
  print("Operators: ${res.operators}");
  print("Punctuations: ${res.punctuations}");
  print("Others: ${res.others}");
}
