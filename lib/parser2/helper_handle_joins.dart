import 'package:lexical_for_sql/parser/common_functions.dart';
import 'package:lexical_for_sql/parser2/helper_components/helper_handleColumnOrConstant.dart';
import 'analyzer2.dart';

class HelperHandleJoins {
  int _startingBraces = 0;
  void handleJoins() {
    CommonFunctions comfun = CommonFunctions();
    {
      //This section of the code determines the availablity of keywords full, outer, join
      //And if it doesn't contains any mistake. like FULL ON and so on.
      if (!comfun.doesItHaveTokensToWork()) {
        return;
      }
      bool doWork = false;
      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.FULL) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        doWork = true;
        Analyze2.index++;
      }

      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.LEFT ||
          Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.RIGHT) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        doWork = true;
        Analyze2.index++;
      }

      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.OUTER ||
          Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.INNER) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        doWork = true;
        Analyze2.index++;
      }

      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.JOIN) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      } else {
        if (doWork) {
          throw Exception(
              "JOIN keyword is missing. if you're using join, make sure you use it correctly.");
        } else {
          return;
        }
      }
    }

    Analyze2.tableColumn.addTable(Analyze2.tokens.sget(Analyze2.index));
    Analyze2.index++;

    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.ON) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    } else if (Analyze2.tokens.uget(Analyze2.index) ==
        Analyze2.keywords.USING) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.uget(Analyze2.index));
      Analyze2.index++;
      //Adding column
      _handleSmallBrace();
      Analyze2.tableColumn
          .addExpectedDotNotation(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      _handleSmallBrace();
      return;
    } else {
      throw Exception("ON OR USING Keyword is Missing in JOINS");
    }

    handleCondition();
  }

  void handleCondition() {
    //First Column or value of JOIN ON column1 = column2
    _handleSmallBrace();
    HelperHandleColumnOrConstant().handleColumnOrConstants();
    _handleSmallBrace();

    //First Operator
    if (Analyze2.operator.isOperator(Analyze2.tokens.sget(Analyze2.index))) {
      Analyze2.operator.addOperator(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    } else {
      throw Exception(
          "Condition is Expected after a join \n=> Like JOIN ON column1 = column2");
    }

    //Second Operator
    if (Analyze2.operator.isOperator(Analyze2.tokens.sget(Analyze2.index))) {
      Analyze2.operator.addOperator(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    }

    //Second Column Or Value
    _handleSmallBrace();
    HelperHandleColumnOrConstant().handleColumnOrConstants();
    _handleSmallBrace();

    if (Analyze2.keywords.AND == Analyze2.tokens.uget(Analyze2.index) ||
        Analyze2.keywords.OR == Analyze2.tokens.uget(Analyze2.index)) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      handleCondition();
    }
  }

  void _handleSmallBrace() {
    if (Analyze2.tokens.sget(Analyze2.index) ==
        Analyze2.punctuation.startSmallBrace) {
      Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      _startingBraces++;
    } else if (Analyze2.tokens.sget(Analyze2.index) ==
        Analyze2.punctuation.endSmallBrace) {
      if (_startingBraces == 0) {
        throw Exception("Mistake in small braces in where condition");
      }
      Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      _startingBraces--;
    }
  }
}
