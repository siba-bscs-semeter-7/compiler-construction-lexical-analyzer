void main(List args) {
  Functions().addFunction("COUNT");
  print("works correctly");
}

class Functions {
  String COUNT = "COUNT";
  String CONCAT = "CONCAT";
  String MAX = "MAX";
  String MIN = "MIN";
  String SUM = "SUM";
  String AVG = "AVG";
  List<String> functions = [];
  List<String> _storeFunctions = [];

  Functions() {
    functions.add(COUNT);
    functions.add(CONCAT);
    functions.add(MAX);
    functions.add(MIN);
    functions.add(SUM);
    functions.add(AVG);
  }

  bool isFunction(String value) {
    return functions.contains(value);
  }

  void addFunction(String function) {
    if (isFunction(function.toUpperCase())) {
      if (_storeFunctions.contains(function)) return;
      _storeFunctions.add(function);
    } else {
      throw Exception("$function is not a Function");
    }
  }

  List<String> get getFunctions => _storeFunctions;
}
