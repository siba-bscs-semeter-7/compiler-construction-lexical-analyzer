import '../parser2/analyzer2.dart';

void main(List args) {
  CommonFunctions fun = CommonFunctions();
  // print(fun.doesItHaveTokensToWork(2, ["hello", 'sjie'].length));
  // print(fun.doesItHaveTokensToWork(2, ["hello", 'sjie', "sjie"].length));
  // print(fun.doesItHaveTokensToWork(2, ["hello"].length));
}

class CommonFunctions {
  //This function takes a character and tells if the character is upper case
  bool isLetterUpperCase(String iden) {
    return (iden.codeUnitAt(0) >= 65 && iden.codeUnitAt(0) <= 90);
  }

  //This function takes a character and tells if the character is lower case
  bool isLetterLowerCase(String iden) {
    return (iden.codeUnitAt(0) >= 97 && iden.codeUnitAt(0) <= 122);
  }

  //This function takes a character and tells if the character is underscore
  bool isUnderScore(String iden) {
    return iden.codeUnitAt(0) == 95;
  }

  bool doesItHaveTokensToWork() {
    //It checks the trackIndex and length of list.
    //it the list length is greater then it returns true and we can work with the list
    //otherwise we have reached to the list's end.
    //This function is created to avoid array index out of bound type exception.
    return Analyze2.index < Analyze2.tokens.length;
  }
}
