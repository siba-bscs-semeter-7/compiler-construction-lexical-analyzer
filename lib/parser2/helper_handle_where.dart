import 'package:lexical_for_sql/parser2/helper_components/helper_handleColumnOrConstant.dart';
import 'analyzer2.dart';

class HelperHandleWhere {
  int _startingBraces = 0;
  final HelperHandleColumnOrConstant _handleColumnsOrConstants =
      HelperHandleColumnOrConstant();

  void handleWhere() {
    //Checking if there are Analyze2.tokens ahead!
    if (!Analyze2.comFun.doesItHaveTokensToWork()) {
      return;
    }

    //if the next keyword is where then continue. otherwise return everything.
    //there may be other word like order by. and not where which is handled
    //somewhere else.
    if (!(Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.WHERE)) {
      return;
    }
    //Adding where keyword
    Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
    Analyze2.index++;

    _handleSmallBrace();

    bool nextCondition = false;
    do {
      handleCondition();
      _handleSmallBrace();
      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.AND ||
          Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.OR) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        nextCondition = true;
        Analyze2.index++;
      } else {
        nextCondition = false;
      }
      _handleSmallBrace();
    } while (nextCondition);

    return;
  }

  void handleCondition() {
    _handleSmallBrace();

    //Checking for not keyword
    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.NOT) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    }

    _handleSmallBrace();

    {
      //First column name of WHERE column1 = column2
      _handleColumnsOrConstants.handleColumnOrConstants();
    }

    // This is for first Operator. =
    if (Analyze2.operator.isOperator(Analyze2.tokens.sget(Analyze2.index))) {
      Analyze2.operator.addOperator(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    }
    //Like Keyword
    else if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.LIKE) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    }

    //In Keyword
    else if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.IN) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;

      if (Analyze2.tokens.sget(Analyze2.index) ==
          Analyze2.punctuation.startSmallBrace) {
        //Adding the small brace.
        Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
        while (true) {
          //Adding columns between small brace
          Analyze2.constants.addConstant(Analyze2.tokens.sget(Analyze2.index));
          Analyze2.index++;
          if (!Analyze2.comFun.doesItHaveTokensToWork()) {
            return;
          } else if (Analyze2.tokens.sget(Analyze2.index) ==
              Analyze2.punctuation.endSmallBrace) {
            Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
            Analyze2.index++;
            break;
          } else if (Analyze2.tokens.sget(Analyze2.index) ==
              Analyze2.punctuation.comma) {
            Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
            Analyze2.index++;
          } else {
            throw Exception("There is some problem near IN keyword");
          }
        }
      } else {
        Analyze2.constants.addConstant(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      }
    }

    //IS Keyword
    else if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.IS) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      // for condition like where column1 is null;
      // for condition like where column1 is NOT null;
      List<String> keywords = [
        Analyze2.keywords.NULL,
        Analyze2.keywords.NOT,
        Analyze2.keywords.NULL
      ];

      for (String i in keywords) {
        if (Analyze2.tokens.uget(Analyze2.index) == i) {
          //for condition like where column1 is not null.
          Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
          Analyze2.index++;
          if (!Analyze2.comFun.doesItHaveTokensToWork()) return;
        }
      }
    }

    //Not Keyword. where column1 not between 30 and 40
    else if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.NOT) {
      //Adding not keyword
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      _handleBetween();
    }

    //Between keyword
    else if (Analyze2.tokens.uget(Analyze2.index) ==
        Analyze2.keywords.BETWEEN) {
      _handleBetween();
    } else {
      throw Exception("There is condition missing");
    }
    // This is for expected second Operator; like <=
    if (Analyze2.operator.isOperator(Analyze2.tokens.sget(Analyze2.index))) {
      Analyze2.operator.addOperator(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    }

    {
      //  Second column of WHERE column1 = column2
      if (Analyze2.tableColumn
              .isNameValid(Analyze2.tokens.sget(Analyze2.index)) ||
          Analyze2.constants.isConstant(Analyze2.tokens.sget(Analyze2.index))) {
        _handleColumnsOrConstants.handleColumnOrConstants();
      }
    }

    _handleSmallBrace();
  }

  void _handleBetween() {
    if (Analyze2.tokens.uget(Analyze2.index) != Analyze2.keywords.BETWEEN) {
      return;
    }
    //Adding between keyword
    Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
    Analyze2.index++;

    bool go = true;
    while (go) {
      Analyze2.constants.addConstant(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.AND ||
          Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.OR) {
        go = true;
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      } else {
        return;
      }
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
