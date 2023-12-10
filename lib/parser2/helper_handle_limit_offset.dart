import 'analyzer2.dart';

class HelperHandleLimitOffset {
  void handleLimitOffset() {
    if (!Analyze2.comFun.doesItHaveTokensToWork()) {
      return;
    }

    //Checking for Limit Keyword
    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.LIMIT) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;

      //Number of Limit Like limit 5
      if (Analyze2.constants
          .isIntConstant(Analyze2.tokens.sget(Analyze2.index))) {
        Analyze2.constants.addConstant(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;

        if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.OFFSET) {
          Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
          Analyze2.index++;

          if (Analyze2.constants
              .isIntConstant(Analyze2.tokens.sget(Analyze2.index))) {
            Analyze2.constants
                .addConstant(Analyze2.tokens.sget(Analyze2.index));
            Analyze2.index++;
          } else {
            throw Exception("Value of offset is invalid!");
          }
        }
      } else {
        throw Exception("Value of Limit is not provided.");
      }

      //  Checking for Column Name.
    } else {
      return;
    }
    return;
  }
}
