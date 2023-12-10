import 'analyzer2.dart';

class HelperHandleGroupBy {
  handleGroups() {
    if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.GROUP) {
      Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.BY) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;
      } else {
        throw Exception("By Keywords is missing after order");
      }
    } else {
      return;
    }

    Analyze2.tableColumn
        .addExpectedDotNotation(Analyze2.tokens.sget(Analyze2.index));
    Analyze2.index++;
  }
}
