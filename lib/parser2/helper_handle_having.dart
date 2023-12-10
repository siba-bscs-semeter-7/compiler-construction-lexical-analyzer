import 'analyzer2.dart';
import 'helper_components/helper_handleColumnOrConstant.dart';
import 'helper_components/helper_handle_functions.dart';

class HelperHandleHaving {
  final HelperHandleColumnOrConstant _handleColumnsOrConstants =
      HelperHandleColumnOrConstant();

  void handleHaving() {
    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.HAVING) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
    } else {
      return;
    }

    handleExpression();
    return;
  }

  void handleExpression() {
    //First Column
    //Checking for function. if not found then it goes inside the if body.
    bool found = HelperHandleFunctions().handleFunctions();

    if (!found) {
      //  First column of WHERE column1 = column2
      _handleColumnsOrConstants.handleColumnOrConstants();
    }

    //It should return if next token is order or it is out of tokens.
    if (!(Analyze2.comFun.doesItHaveTokensToWork())) {
      return;
    }
    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.ORDER) {
      return;
    }

    //First Punctuation like =
    if (Analyze2.operator.isOperator(Analyze2.tokens.sget(Analyze2.index))) {
      Analyze2.operator.addOperator(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      //Second Punctuation like <=
      if (Analyze2.operator.isOperator(Analyze2.tokens.sget(Analyze2.index))) {
        Analyze2.operator.addOperator(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      }
    }

    //Second column
    _handleColumnsOrConstants.handleColumnOrConstants();

    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.AND ||
        Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.OR) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.uget(Analyze2.index));
      Analyze2.index++;
      handleExpression();
    }
  }
}
