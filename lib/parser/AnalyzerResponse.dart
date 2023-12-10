class AnalyzerResponse {
  final List keywords;
  final List punctuations;
  final List operators;
  final List functions;
  final List tables;
  final List columns;
  final List others;
  AnalyzerResponse({
    required this.keywords,
    required this.punctuations,
    required this.operators,
    required this.columns,
    required this.functions,
    required this.tables,
    required this.others,
  });
}
