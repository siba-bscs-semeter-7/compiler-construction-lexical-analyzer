class HandleTokens {
  final List _tokens;
  HandleTokens(this._tokens);
  String uget(int index) {
    //All Uppercase tokens.
    return _tokens[index].toString().toUpperCase();
  }

  String sget(int index) {
    //Straight away tokens.
    return _tokens[index];
  }

  int get length => _tokens.length;
}
