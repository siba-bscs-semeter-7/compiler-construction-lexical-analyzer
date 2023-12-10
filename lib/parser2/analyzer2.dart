import 'package:lexical_for_sql/parser/Keywords.dart';
import 'package:lexical_for_sql/parser/common_functions.dart';
import 'package:lexical_for_sql/parser/constants.dart';
import 'package:lexical_for_sql/parser/functions.dart';
import 'package:lexical_for_sql/parser/operator.dart';
import 'package:lexical_for_sql/parser/punctuation.dart';
import 'package:lexical_for_sql/parser/table_column.dart';
import 'package:lexical_for_sql/parser/tokanization.dart';
import 'package:lexical_for_sql/parser2/helper_handle_columns.dart';
import 'package:lexical_for_sql/parser2/helper_handle_joins.dart';
import 'package:lexical_for_sql/parser2/helper_handle_orderby.dart';
import 'package:lexical_for_sql/parser2/helper_handle_tokens.dart';
import 'package:lexical_for_sql/parser2/helper_handle_where.dart';
import '../test/models/test_data_model.dart';
import '../test/testData.dart';
import 'helper_handle_groupby.dart';
import 'helper_handle_having.dart';
import 'helper_handle_limit_offset.dart';
import 'dart:io';

void main(List args) {
  stdout.write("Enter id: ");
  String? input = stdin.readLineSync();
  if (input == null) {
    print("No Input Provided");
    return;
  }
  int? id;
  try {
    id = int.parse(input);
  } catch (e) {
    print("Only Enter Numeric Data");
  }
  if (id != null) {
    int index = id - 1;
    TestDataModel model = TestDataModel.fromMap(TestData().data[index]);
    Analyze2 analyze2 = Analyze2();
    analyze2.showResults = true;
    analyze2.analyze(model.query);
  }
}

class Analyze2 {
  bool showResults = false;
  static TableColumn tableColumn = TableColumn();
  static Punctuation punctuation = Punctuation();
  static Keywords keywords = Keywords();
  static Constants constants = Constants();
  static Functions functions = Functions();
  static Operator operator = Operator();
  static CommonFunctions comFun = CommonFunctions();
  static int index = 0;
  static late HandleTokens tokens;

  Analyze2Response analyze(String sqlQuery) {
    List createdTokens = Tokanization().createTokens(sqlQuery);
    if (showResults) print("TOKENS: $createdTokens \n\n");
    tokens = HandleTokens(createdTokens);

    //  First one has to be SELECT statement...
    if (tokens.uget(index) == keywords.SELECT) {
      keywords.addKeyword(tokens.sget(index));
      index++;
    } else {
      throw Exception("query must start with SELECT keyword");
    }

    if (tokens.uget(index) == keywords.DISTINCT) {
      keywords.addKeyword(tokens.sget(index));
      index++;
    }

    //  Second the Column Names.
    HelperHandleColumns().handleColumns();

    // Getting From Keyword
    keywords.addKeyword(tokens.sget(index));

    ++index;
    //Get the table name
    tableColumn.addTable(tokens.sget(index));

    //Now Handling Joins Part
    index++;

    //Joins
    HelperHandleJoins().handleJoins();

    //Where
    HelperHandleWhere().handleWhere();

    //GROUP BY
    HelperHandleGroupBy().handleGroups();

    //Having

    HelperHandleHaving().handleHaving();

    //Order By
    HelperHandleOrderBy().handleOrder();

    //Limit and Offset Section
    HelperHandleLimitOffset().handleLimitOffset();

    if (comFun.doesItHaveTokensToWork()) {
      if (tokens.sget(index) == punctuation.semiColon) {
        punctuation.add(tokens.sget(index));
      }
    }

    if (showResults) {
      print("Tokens Reached at End: ${tokens.length == index + 1}");
      // print("Length is: ${tokens.length}");
      // print("Index is: ${index}");

      print("Keywords: ${keywords.getKeyword}");
      print("Table: ${tableColumn.getTables}");
      print("Column: ${tableColumn.getColumns}");
      print("Operators: ${operator.getOperators}");
      print("Functions: ${functions.getFunctions}");
      print("Punctuation: ${punctuation.get}");
      print("Constants: ${constants.getConstants}");
    }
    return returnResponse();
  }

  Analyze2Response returnResponse() {
    return Analyze2Response(
      keywords: keywords,
      tableColumn: tableColumn,
      punctuation: punctuation,
      constants: constants,
      functions: functions,
      operators: operator,
    );
  }

  void dispose() {
    tableColumn = TableColumn();
    punctuation = Punctuation();
    keywords = Keywords();
    constants = Constants();
    functions = Functions();
    operator = Operator();
    comFun = CommonFunctions();
    index = 0;
  }
}

class Analyze2Response {
  final Keywords keywords;
  final TableColumn tableColumn;
  final Functions functions;
  final Punctuation punctuation;
  final Constants constants;
  final Operator operators;
  Analyze2Response({
    required this.keywords,
    required this.tableColumn,
    required this.punctuation,
    required this.constants,
    required this.functions,
    required this.operators,
  });
}
