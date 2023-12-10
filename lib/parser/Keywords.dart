class Keywords {
  final String WHERE = "WHERE";
  final String SELECT = "SELECT";
  final String FROM = "FROM";
  final String DISTINCT = "DISTINCT";
  final String LIMIT = "LIMIT";
  final String OFFSET = "OFFSET";
  final String AS = "AS";
  final String IN = "IN";
  final String BETWEEN = "BETWEEN";
  final String COLUMN = "COLUMN";
  final String NULL = "NULL";
  final String GROUP = "GROUP";
  final String ORDER = "ORDER";
  final String BY = "BY";
  final String HAVING = "HAVING";
  final String ASC = "ASC";
  final String DESC = "DESC";
  final String JOIN = "JOIN";
  final String LEFT = "LEFT";
  final String RIGHT = "RIGHT";
  final String INNER = "INNER";
  final String OUTER = "OUTER";
  final String ON = "ON";
  final String LIKE = "LIKE";
  final String UNION = "UNION";
  final String ALL = "ALL";
  final String ANY = "ANY";
  final String SOME = "SOME";
  final String CASE = "CASE";
  final String WHEN = "WHEN";
  final String THEN = "THEN";
  final String ELSE = "ELSE";
  final String END = "END";
  final String PRIMARY = "PRIMARY";
  final String KEY = "KEY";
  final String EXISTS = "EXISTS";
  final String FULL = "FULL";
  final String AND = "AND";
  final String OR = "OR";
  final String NOT = "NOT";
  final String IS = "IS";
  final String USING = "USING";
  List<String> keywords = [];

  final List<String> _storeKeywords = [];

  Keywords() {
    keywords.add(WHERE);
    keywords.add(SELECT);
    keywords.add(FROM);
    keywords.add(DISTINCT);
    keywords.add(LIMIT);
    keywords.add(OFFSET);
    keywords.add(AS);
    keywords.add(IN);
    keywords.add(BETWEEN);
    keywords.add(COLUMN);
    keywords.add(NULL);
    keywords.add(GROUP);
    keywords.add(ORDER);
    keywords.add(BY);
    keywords.add(HAVING);
    keywords.add(ASC);
    keywords.add(DESC);
    keywords.add(JOIN);
    keywords.add(LEFT);
    keywords.add(RIGHT);
    keywords.add(INNER);
    keywords.add(OUTER);
    keywords.add(ON);
    keywords.add(LIKE);
    keywords.add(UNION);
    keywords.add(ALL);
    keywords.add(ANY);
    keywords.add(SOME);
    keywords.add(CASE);
    keywords.add(WHEN);
    keywords.add(THEN);
    keywords.add(ELSE);
    keywords.add(END);
    keywords.add(PRIMARY);
    keywords.add(KEY);
    keywords.add(EXISTS);
    keywords.add(FULL);
    keywords.add(AND);
    keywords.add(OR);
    keywords.add(NOT);
    keywords.add(IS);
    keywords.add(USING);
  }

  bool isKeyword(String s) {
    return keywords.contains(s.toUpperCase());
  }

  void addKeyword(String keyword) {
    String uKeywored = keyword.toUpperCase();
    if (_storeKeywords.contains(uKeywored)) {
      return;
    }
    _storeKeywords.add(keyword);
  }

  List<String> get getKeyword => _storeKeywords;
}
