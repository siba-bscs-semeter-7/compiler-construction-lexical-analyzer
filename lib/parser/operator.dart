class Operator {
  String plus = "+";
  String minus = "-";
  String divide = "/";
  String multiply = "*";
  String pipe = "|";

  String greaterThan = ">";
  String lessThan = "<";
  String equalTo = "=";
  String greaterThanEqualTo = ">=";
  String lessThanEqualTo = "<=";

  List<String> operator = [];
  final List<String> _storeOperator = [];
  Operator() {
    operator.add(plus);
    operator.add(minus);
    operator.add(multiply);
    operator.add(divide);
    operator.add(greaterThan);
    operator.add(lessThan);
    operator.add(equalTo);
    operator.add(greaterThanEqualTo);
    operator.add(lessThanEqualTo);
  }

  bool isOperator(String value) {
    return operator.contains(value);
  }

  void addOperator(String value) {
    if (isOperator(value)) {
      if (_storeOperator.contains(value)) return;
      _storeOperator.add(value);
    }
  }

  List<String> get getOperators => _storeOperator;
  int get operatorLength => _storeOperator.length;
}
