import 'package:lexical_for_sql/parser/analyzer.dart';
import '../parser/AnalyzerResponse.dart';
import './defined_functions.dart';
import './testData.dart';

void main(List args) {
  List data = TestData().data;
  TestDataFields fs = TestDataFields();
  Analyzer analyze = Analyzer();
  DefinedFunctions funs = DefinedFunctions();

  for (Map item in data) {
    AnalyzerResponse res = analyze.analyze(item[fs.query]);
    if (!funs.compareLists(res.tables, item[fs.tables])) {
      printTestFailed(item[fs.id], "Tables Not Matched",
          parsedData: res.tables, originalData: item[fs.tables]);
      break;
    }

    if (!funs.compareLists(res.columns, item[fs.columns])) {
      printTestFailed(item[fs.id], "Columns Not Matched",
          originalData: item[fs.columns], parsedData: res.columns);
      break;
    }

    if (!funs.compareLists(res.operators, item[fs.operators])) {
      printTestFailed(item[fs.id], "Operators Not Matched",
          originalData: item[fs.operators], parsedData: res.operators);
      break;
    }

    if (!funs.compareLists(res.keywords, item[fs.keywords])) {
      printTestFailed(item[fs.id], "Columns Not Matched",
          originalData: item[fs.keywords], parsedData: res.keywords);
      break;
    }

    if (!funs.compareLists(res.punctuations, item[fs.punctuations])) {
      printTestFailed(item[fs.id], "Columns Not Matched",
          originalData: item[fs.punctuations], parsedData: res.punctuations);
      break;
    }

    if (!funs.compareLists(res.functions, item[fs.functions])) {
      printTestFailed(item[fs.id], "Functions Not Matched",
          originalData: item[fs.functions], parsedData: res.functions);
      break;
    }

    if (!funs.compareLists(res.others, item[fs.others])) {
      printTestFailed(item[fs.id], "Others Not Matched",
          originalData: item[fs.functions], parsedData: res.functions);
      break;
    }

    printTestPassed(item[fs.id]);
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
}

void printTestPassed(int id) {
  print("Test Id: $id -> Test Passed");
}
