import 'package:flutter/material.dart';
import 'package:lexical_for_sql/parser/AnalyzerResponse.dart';
import 'package:lexical_for_sql/parser/analyzer.dart';
import 'package:lexical_for_sql/xutils/xtextfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController inputController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController tablesController = TextEditingController();
  TextEditingController columnsController = TextEditingController();
  TextEditingController functionsController = TextEditingController();
  TextEditingController punctuationsController = TextEditingController();
  TextEditingController operatorsController = TextEditingController();
  TextEditingController othersController = TextEditingController();

  double heightbwfields = 10;
  bool textFieldEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lexical Parser for SQL",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Input TextFields
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 2),
                        boxShadow: const [
                          BoxShadow(color: Colors.blueAccent, blurRadius: 20)
                        ]),
                    child: XTextField(
                      controller: inputController,
                      minLines: 15,
                      filled: true,
                      fillColor: Colors.white,
                      hint: "Enter SQL Code Here",
                    ),
                  ),

                  const SizedBox(height: 20),

                  //Parse Button
                  ElevatedButton(
                    onPressed: () {
                      String text = inputController.text;
                      if (text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please Enter the Code first")));
                        return;
                      }
                      AnalyzerResponse res = Analyzer().analyze(text);
                      keywordsController.text =
                          formatListToString(res.keywords);
                      tablesController.text = formatListToString(res.tables);
                      columnsController.text = formatListToString(res.columns);
                      functionsController.text =
                          formatListToString(res.functions);
                      punctuationsController.text =
                          formatListToString(res.punctuations);
                      operatorsController.text =
                          formatListToString(res.operators);
                      othersController.text = formatListToString(res.others);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, right: 30, left: 30),
                      child: Text(
                        "Parse",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              //All the fields of output...keywords, tables, columns, functions, punctuations,operators, others
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Keywords
                  const Text(
                    "KEYWORDS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of keywords
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: keywordsController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  //Tables
                  SizedBox(height: heightbwfields),
                  const Text(
                    "TABLES",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of TABLES
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: tablesController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: heightbwfields),
                  //COLUMNS
                  const Text(
                    "COLUMNS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of COLUMNS
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: columnsController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: heightbwfields),
                  const Text(
                    "FUNCTIONS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of FUNCTIONS
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: functionsController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: heightbwfields),
                  //PUNCTUATIONS
                  const Text(
                    "PUNCTUATIONS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of PUNCTUATIONS
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: punctuationsController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: heightbwfields),
                  //OPERATORS
                  const Text(
                    "OPERATORS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of OPERATORS
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: operatorsController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: heightbwfields),
                  //OTHERS
                  const Text(
                    "OTHERS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  //Textfield of Columns
                  SizedBox(
                    width: 550,
                    child: XTextField(
                      controller: othersController,
                      enabled: textFieldEditable,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatListToString(List s) {
    String str = s.toString();
    str = str.substring(1, str.length - 1);
    return str.isEmpty ? "NOT FOUND" : str;
  }
}
