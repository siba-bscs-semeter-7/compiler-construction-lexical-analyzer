class Constants {
  final stringType = "String";
  final intType = "int";
  final doubleType = "double";
  final notConstant = "Not A Constant";

  final List<String> _storeConstants = [];

  bool isStringConstant(String s) {
    //It returns true and false based on if the given value is string or not.
    //It recognizes the string by checking if it start and ends with " or '
    return (s.startsWith("\"") || s.startsWith("'")) &&
        (s.endsWith("\"") || s.endsWith("'"));
  }

  bool isIntConstant(String s) {
    try {
      int.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isDoubleConstant(String s) {
    try {
      double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isConstant(String s) {
    return isStringConstant(s) || isIntConstant(s) || isDoubleConstant(s);
  }

  String constantType(String s) {
    if (isStringConstant(s)) {
      return stringType;
    } else if (isIntConstant(s)) {
      return intType;
    } else if (isDoubleConstant(s)) {
      return doubleType;
    } else {
      return notConstant;
    }
  }

  void addConstant(String value) {
    if (isConstant(value)) {
      if (_storeConstants.contains(value)) return;
      _storeConstants.add(value);
    } else {
      throw Exception("$value is Not a Constant");
    }
  }

  List<String> get getConstants => _storeConstants;
}
