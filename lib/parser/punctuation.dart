class Punctuation {
  String double_colon = '"';
  String semiColon = ";";
  String comma = ",";
  String singleColon = "'";
  String doubleColon = '"';
  String startSmallBrace = "(";
  String endSmallBrace = ")";
  List<String> literals = [];
  final List _store = [];

  Punctuation() {
    literals.add(double_colon);
    literals.add(semiColon);
    literals.add(comma);
    literals.add(singleColon);
    literals.add(doubleColon);
    literals.add(startSmallBrace);
    literals.add(endSmallBrace);
  }

  bool isPunctuation(String value) {
    return literals.contains(value);
  }

  void add(String punctuation) {
    if (_store.contains(punctuation)) {
      return;
    }
    _store.add(punctuation);
  }

  List get get => _store;
}
