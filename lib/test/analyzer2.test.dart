import 'package:lexical_for_sql/parser2/analyzer2.dart';
import './defined_functions.dart';
import './testData.dart';

void main(List args) {
  Analyzer2Test().startTesting();
}

class Analyzer2Test {
  final TestDataFields _fs = TestDataFields();
  Map? _item;
  void startTesting() {
    List data = TestData().data;

    // Analyze2 analyze = Analyze2();
    DefinedFunctions funs = DefinedFunctions();

    for (Map item in data) {
      _item = item;
      Analyze2 analyze2 = Analyze2();
      analyze2.dispose();
      Analyze2Response res = analyze2.analyze(item[_fs.query]);
      if (!funs.compareLists(res.tableColumn.getTables, item[_fs.tables])) {
        printTestFailed(item[_fs.id], "Tables Not Matched",
            parsedData: res.tableColumn.getTables,
            originalData: item[_fs.tables]);
        break;
      }

      if (!funs.compareLists(res.tableColumn.getColumns, item[_fs.columns])) {
        printTestFailed(item[_fs.id], "Columns Not Matched",
            originalData: item[_fs.columns],
            parsedData: res.tableColumn.getColumns);
        break;
      }

      if (!funs.compareLists(res.operators.getOperators, item[_fs.operators])) {
        printTestFailed(item[_fs.id], "Operators Not Matched",
            originalData: item[_fs.operators],
            parsedData: res.operators.getOperators);
        break;
      }

      if (!funs.compareLists(res.keywords.getKeyword, item[_fs.keywords])) {
        printTestFailed(item[_fs.id], "Keywords Not Matched",
            originalData: item[_fs.keywords],
            parsedData: res.keywords.getKeyword);
        break;
      }

      if (!funs.compareLists(res.punctuation.get, item[_fs.punctuations])) {
        printTestFailed(item[_fs.id], "Punctuations Not Matched",
            originalData: item[_fs.punctuations],
            parsedData: res.punctuation.get);
        break;
      }

      if (!funs.compareLists(res.functions.getFunctions, item[_fs.functions])) {
        printTestFailed(item[_fs.id], "Functions Not Matched",
            originalData: item[_fs.functions],
            parsedData: res.functions.getFunctions);
        break;
      }

      // if (!funs.compareLists(res.others, item[fs.others])) {
      //   printTestFailed(item[fs.id], "Others Not Matched",
      //       originalData: item[fs.functions], parsedData: res.functions);
      //   break;
      // }

      printTestPassed(item[_fs.id]);
    }
  }

  void printTestFailed(int id, String msg,
      {List? originalData, List? parsedData}) {
    print("Test Id: $id -> Test Failed");
    print(msg);
    if (originalData != null) {
      print("Original Data: $originalData");
    }
    if (parsedData != null) {
      print("Parsed Data: $parsedData");
    }
    if (_item != null) {
      print(_item?[_fs.query]);
    }
  }

  void printTestPassed(int id) {
    print("Test Id: $id -> Test Passed");
  }
}
