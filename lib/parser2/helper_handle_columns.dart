import '../parser/table_column.dart';
import 'analyzer2.dart';
import 'helper_components/helper_handle_functions.dart';

class HelperHandleColumns {
  /*
  * This class will handle the column names, functions and check if they are correct
  * Like {SELECT column1, column2, column3 FROM}
  *
  * */

  void handleColumns() {
    //They start from 1 since 0 index has to be {SELECT} keyword
    //This loop also handles and put FROM keyword
    while (true) {
      //Handles if tables names are like. Table.column --> SELECT {table.column} from table
      String? tableName;
      String? columnName;

      //Checking for function. if not found then it goes inside the if body down for checking for columns.
      bool found = HelperHandleFunctions().handleFunctions();

      if (!found) {
        //If function not found, then it goes for checking of columns
        if (Analyze2.tokens.sget(Analyze2.index).contains(".")) {
          DotNotationResponse dotNotation = Analyze2.tableColumn
              .separateDotNotation(Analyze2.tokens.sget(Analyze2.index));
          tableName = dotNotation.tableName;
          columnName = dotNotation.columnName;
        } else {
          //Handles straight forward names like SELECT {column} FROM table
          columnName = Analyze2.tokens.sget(Analyze2.index);
        }

        Analyze2.tableColumn.addColumn(columnName);
        if (tableName != null) {
          Analyze2.tableColumn.addTable(tableName);
        }
        Analyze2.index++;
      }

      //Handling Aleases
      if (Analyze2.tokens.uget(Analyze2.index) == Analyze2.keywords.AS) {
        Analyze2.keywords.addKeyword(Analyze2.tokens.sget(Analyze2.index));
        Analyze2.index = Analyze2.index + 2;
      }

      //  Punctuations Like SELECT column1{,} column2 FROM table..
      //Before checking for comma, it makes sure that at least one column name appeared;
      //It reaches to punctuation b/c they are always after the column name
      if (!Analyze2.comFun.doesItHaveTokensToWork()) {
        throw Exception("Looks Like FROM keyword is missing");
      } else if (Analyze2.tokens.sget(Analyze2.index) ==
          Analyze2.punctuation.comma) {
        Analyze2.punctuation.add(Analyze2.tokens.sget(Analyze2.index));
      } else if (Analyze2.tokens.uget(Analyze2.index) ==
          Analyze2.keywords.FROM) {
        return;
      } else {
        throw Exception("A comma is missing after column name $columnName");
      }
      Analyze2.index++;
    }
  }
}
