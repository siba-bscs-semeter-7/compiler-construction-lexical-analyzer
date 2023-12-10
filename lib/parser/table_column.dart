import 'package:lexical_for_sql/parser/common_functions.dart';
import 'Keywords.dart';

class TableColumn {
  final List _listTables = [];
  final List _listColumns = [];
  final CommonFunctions _comFun = CommonFunctions();
  bool isNameValid(String iden) {
    if (iden == "*") {
      return true;
    }

    Keywords keywords = Keywords();
    if (keywords.isKeyword(iden)) {
      return false;
    }

    // Checking if it starts with upper or lower or underscore...
    bool notUpperCaseLetter = !_comFun.isLetterUpperCase(iden[0]);
    bool notLowerCaseLetter = !_comFun.isLetterLowerCase(iden[0]);
    bool notUnderScore = !_comFun.isUnderScore(iden[0]);
    if (notUpperCaseLetter && notLowerCaseLetter && notUnderScore) {
      return false;
    }

    return true;
  }

  DotNotationResponse separateDotNotation(String s) {
    int dotIndex = s.indexOf(".");
    String tableName = s.substring(0, dotIndex);
    String columnName = s.substring(dotIndex + 1, s.length);
    DotNotationResponse dot =
        DotNotationResponse(tableName: tableName, columnName: columnName);
    return dot;
  }

  void addTable(String table) {
    if (!_listTables.contains(table)) {
      if (isNameValid(table)) {
        _listTables.add(table);
      } else {
        throw Exception("Table Name: $table is not valid");
      }
    }
  }

  void addColumn(String column) {
    if (!_listColumns.contains(column)) {
      if (isNameValid(column)) {
        _listColumns.add(column);
      } else {
        throw Exception("Column Name: $column is not valid");
      }
    }
  }

  void addExpectedDotNotation(String dotN) {
    int index = dotN.indexOf(".");
    if (index != -1) {
      DotNotationResponse response = separateDotNotation(dotN);
      addTable(response.tableName);
      addColumn(response.columnName);
    } else {
      addColumn(dotN);
    }
  }

  List get getTables => _listTables;

  List get getColumns => _listColumns;
}

class DotNotationResponse {
  String tableName = "";
  String columnName = "";
  DotNotationResponse({required this.tableName, required this.columnName});
}
