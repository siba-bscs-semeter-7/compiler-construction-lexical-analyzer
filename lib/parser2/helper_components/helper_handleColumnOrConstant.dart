import '../analyzer2.dart';

class HelperHandleColumnOrConstant {
  bool handleColumnOrConstants() {
    if (Analyze2.tableColumn
        .isNameValid(Analyze2.tokens.sget(Analyze2.index))) {
      Analyze2.tableColumn
          .addExpectedDotNotation(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      return true;
    } else if (Analyze2.constants
        .isConstant(Analyze2.tokens.sget(Analyze2.index))) {
      //  Checking if it is a constant.
      Analyze2.constants.addConstant(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;
      return true;
    }
    return false;
  }
}
