import 'AnalyzerResponse.dart';
import 'Keywords.dart';
import 'functions.dart';
import 'operator.dart';
import 'punctuation.dart';
import 'table_column.dart';
import 'tokanization.dart';

class Analyzer {
  AnalyzerResponse analyze(String s) {
    Keywords keyword = Keywords();
    Punctuation punctuation = Punctuation();
    Functions function = Functions();
    Operator operator = Operator();
    TableColumn tableColumn = TableColumn();

    List tokens = Tokanization().createTokens(s);
    List listOperators = [];
    List listKeywords = [];
    List listPunctuations = [];
    List listFunctions = [];
    List listOthers = [];

    List tableIndicator = [keyword.FROM, keyword.JOIN];
    bool isTableIndicatorAppeared = false;

    for (String element in tokens) {
      if (isTableIndicatorAppeared) {
        tableColumn.addTable(element);
        isTableIndicatorAppeared = false;
        continue;
      }

      if (keyword.isKeyword(element)) {
        if (!listKeywords.contains(element)) {
          listKeywords.add(element);
          if (tableIndicator.contains(element)) {
            isTableIndicatorAppeared = true;
          }
        }
      } else if (operator.isOperator(element)) {
        if (!listOperators.contains(element)) listOperators.add(element);
      } else if (punctuation.isPunctuation(element)) {
        if (!listPunctuations.contains(element)) listPunctuations.add(element);
      } else if (function.isFunction(element)) {
        if (!listFunctions.contains(element)) listFunctions.add(element);
      } else if (element.contains(".")) {
        DotNotationResponse dot = tableColumn.separateDotNotation(element);
        tableColumn.addTable(dot.tableName);
        tableColumn.addColumn(dot.columnName);
      } else if (tableColumn.isNameValid(element)) {
        tableColumn.addColumn(element);
      } else {
        listOthers.add(element);
      }
    }
    return AnalyzerResponse(
      keywords: listKeywords,
      punctuations: listPunctuations,
      operators: listOperators,
      columns: tableColumn.getColumns,
      functions: listFunctions,
      tables: tableColumn.getTables,
      others: listOthers,
    );
  }
}
