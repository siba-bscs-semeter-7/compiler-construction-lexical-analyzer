import 'analyzer2.dart';

class HelperHandleOrderBy {
  handleOrder() {
    if (!Analyze2.comFun.doesItHaveTokensToWork()) {
      return;
    }

    //Checking or ORDER keyword
    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.ORDER) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      //Checking for BY keyword
      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.BY) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      } else {
        throw Exception("By Keywords is missing after order");
      }
    } else {
      return;
    }

    while (true) {
      Analyze2.tableColumn
          .addExpectedDotNotation(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;

      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.ASC ||
          Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.DESC) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      }
      if (!Analyze2.comFun.doesItHaveTokensToWork()) {
        break;
      } else if (Analyze2.tokens.uget(Analyze2.index) ==
          Analyze2.punctuation.semiColon) {
        break;
      } else if (Analyze2.tokens.uget(Analyze2.index) ==
          Analyze2.keywords.LIMIT) {
        break;
      } else if (Analyze2.tokens.uget(Analyze2.index) ==
          Analyze2.punctuation.comma) {
        Analyze2.punctuation.add(Analyze2.tokens.uget(Analyze2.index));
        Analyze2.index++;
      }
    }
  }
}
