import 'operator.dart';
import 'punctuation.dart';

class Tokanization {
  List<String> createTokens(String stmt) {
    String commentSymbol = "-";
    bool commentStarted = false;

    Punctuation pun = Punctuation();
    Operator op = Operator();
    List<String> tokens = [];
    stmt = stmt.trim();
    String word = "";
    bool startCotes = false;
    for (int i = 0; i < stmt.length; i++) {
      // Identifies the Comment
      if ((stmt[i] == commentSymbol && stmt[i + 1] == commentSymbol) ||
          commentStarted) {
        commentStarted = stmt[i] != "\n";
        continue;
      }

      // Identifies the String value;
      if (stmt[i] == '"' || stmt[i] == "'") {
        word += stmt[i];
        startCotes = !startCotes;
        if (!startCotes) {
          tokens.add(word);
          word = "";
        }
        continue;
      } else if (startCotes) {
        word += stmt[i];
        continue;
      }

      // Identifies Punctions that are without spaces
      bool isPunction = pun.isPunctuation(stmt[i]);

      //Checking for Operators
      if (op.isOperator(stmt[i])) {
        tokens.add(stmt[i]);
        continue;
      }

      // Identifies the Int Value;
      if (stmt[i] == " " || stmt[i] == "\n" || isPunction) {
        if (word != "") {
          tokens.add(word);
          word = "";
        }
      } else {
        word += stmt[i];
      }

      // Identifies Punctions that are without spaces
      if (isPunction) {
        tokens.add(stmt[i]);
      }
    }
    if (word != "") {
      tokens.add(word);
    }
    return tokens;
  }
}
