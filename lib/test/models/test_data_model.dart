import 'package:lexical_for_sql/test/testData.dart';

class TestDataModel {
  final int id;
  final String query;
  final List keywords;
  final List operators;
  final List punctuations;
  final List functions;
  final List columns;
  final List tables;
  final List constants;
  final List others;

  TestDataModel({
    required this.id,
    required this.query,
    required this.keywords,
    required this.operators,
    required this.punctuations,
    required this.functions,
    required this.columns,
    required this.tables,
    required this.constants,
    required this.others,
  });

  factory TestDataModel.fromMap(Map data) {
    TestDataFields fs = TestDataFields();
    return TestDataModel(
      id: data[fs.id],
      query: data[fs.query],
      keywords: data[fs.keywords],
      operators: data[fs.operators],
      punctuations: data[fs.punctuations],
      functions: data[fs.functions],
      columns: data[fs.columns],
      tables: data[fs.tables],
      constants: data[fs.constants],
      others: data[fs.others],
    );
  }
}
