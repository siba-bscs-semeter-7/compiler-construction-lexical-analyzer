import '../analyzer2.dart';

class HelperHandleFunctions {
  bool handleFunctions() {
    //Looking for function like count, sum etc
    if (Analyze2.functions.isFunction(Analyze2.tokens.uget(Analyze2.index))) {
      if (!(Analyze2.punctuation.startSmallBrace ==
          Analyze2.tokens.uget(Analyze2.index + 1))) {
        return false;
      }

      Analyze2.functions.addFunction(Analyze2.tokens.sget(Analyze2.index));
      Analyze2.index++;

      //  First opening of curly brace
      if (Analyze2.tokens.sget(Analyze2.index) ==
          Analyze2.punctuation.startSmallBrace) {
        Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index++;

        //Checking for column Name
        if (Analyze2.tableColumn
            .isNameValid(Analyze2.tokens.sget(Analyze2.index))) {
          Analyze2.tableColumn
              .addExpectedDotNotation(Analyze2.tokens.sget(Analyze2.index));
          Analyze2.index++;

          //  Checking for closing of curly brace
          if (Analyze2.tokens.sget(Analyze2.index) ==
              Analyze2.punctuation.endSmallBrace) {
            Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
            Analyze2.index++;

            return true;
          }
        }
      }
      throw Exception(
          "Invalid Declaration of ${Analyze2.tokens.sget(Analyze2.index)}");
    }
    return false;
  }
}
