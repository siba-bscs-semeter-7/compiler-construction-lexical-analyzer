class TestData {
  List data = [
    {
      "id": 1,
      "query": """
      -- These are comments.
SELECT Customers.customer_id, Customers.first_name, Orders.item
FROM Customers
FULL OUTER JOIN Orders
ON Customers.customer_id = Orders.customer_id;
      """,
      "keywords": ["SELECT", "FROM", "FULL", "OUTER", "JOIN", "ON"],
      "operators": ["="],
      "punctuations": [";", ","],
      "functions": [],
      "columns": ["customer_id", "first_name", "item"],
      "tables": ["Orders", "Customers"],
      "constants": [],
      "others": [],
    },
    {
      "id": 2,
      "query": """
      -- select first_name from Customers table
SELECT first_name
FROM Customers;
      """,
      "keywords": ["SELECT", "FROM"],
      "operators": [],
      "punctuations": [";"],
      "functions": [],
      "columns": ["first_name"],
      "tables": ["Customers"],
      "constants": [],
      "others": [],
    },
    {
      "id": 3,
      "query": """
      SELECT *
FROM Customers
WHERE age > 25;
""",
      "keywords": ["SELECT", "FROM", "WHERE"],
      "operators": [">"],
      "punctuations": [";"],
      "functions": [],
      "columns": ["age", "*"],
      "tables": ["Customers"],
      "constants": ["25"],
      "others": [],
    },
    {
      "id": 4,
      "query": """
-- select the first_name and last_name of all customers
-- who live in 'USA' and have the last name 'Doe'

SELECT first_name, last_name
FROM Customers
WHERE country = 'USA' AND last_name = "Doe";
""",
      "keywords": ["SELECT", "FROM", "WHERE", "AND"],
      "operators": ["="],
      "punctuations": [";", ","],
      "functions": [],
      "columns": ["first_name", "last_name", "country"],
      "tables": ["Customers"],
      "constants": ["USA", "Doe"],
      "others": [],
    },
    {
      "id": 5,
      "query": """
-- select first and last name of customers
-- who either live in the USA
-- or have the last name 'Doe'

SELECT first_name, last_name
FROM Customers
WHERE country = 'USA' OR last_name = 'Doe';
""",
      "keywords": ["SELECT", "FROM", "WHERE", "OR"],
      "operators": ["="],
      "punctuations": [";", ","],
      "functions": [],
      "columns": ["first_name", "last_name", "country"],
      "tables": ["Customers"],
      "constants": ["USA", "Doe"],
      "others": [],
    },
    {
      "id": 6,
      "query": """
-- select customers who don't live in the USA

SELECT first_name, last_name
FROM Customers
WHERE NOT country = 'USA';
""",
      "keywords": ["SELECT", "FROM", "WHERE", "NOT"],
      "operators": ["="],
      "punctuations": [";", ","],
      "functions": [],
      "columns": ["first_name", "last_name", "country"],
      "tables": ["Customers"],
      "constants": ["USA"],
      "others": [],
    },
    {
      "id": 7,
      "query": """
-- select customers who live in either USA or UK and whose age is less than 26

SELECT *
FROM Customers
WHERE (country = 'USA' OR country = 'UK') AND age < 26;
""",
      "keywords": ["SELECT", "FROM", "WHERE", "OR", "AND"],
      "operators": ["<", "="],
      "punctuations": [";", "(", ")"],
      "functions": [],
      "columns": ["*", "country", "age"],
      "tables": ["Customers"],
      "constants": ["USA", "UK", "26"],
      "others": [],
    },
    {
      "id": 8,
      "query": "SELECT column1, column2 FROM table;",
      "keywords": ["SELECT", "FROM"],
      "operators": [],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table"],
      "constants": [],
      "others": []
    },
    {
      "id": 9,
      "query": "SELECT column1, column2 FROM table WHERE column1 = 25;",
      "keywords": ["SELECT", "FROM", "WHERE"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table"],
      "constants": [],
      "others": ["condition"]
    },
    {
      "id": 10,
      "query": "SELECT column1, column2 FROM table ORDER BY column1 ASC;",
      "keywords": ["SELECT", "FROM", "ORDER", "BY", "ASC"],
      "operators": [],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table"],
      "constants": [],
      "others": []
    },
    {
      "id": 11,
      "query":
          "SELECT DISTINCT column1 FROM table WHERE table.column2 > 25 ORDER BY column1 DESC;",
      "keywords": [
        "SELECT",
        "DISTINCT",
        "FROM",
        "WHERE",
        "ORDER",
        "BY",
        "DESC"
      ],
      "operators": [">"],
      "punctuations": [";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table"],
      "constants": [],
      "others": ["condition"]
    },
    {
      "id": 12,
      "query": "SELECT COUNT(*) AS total_rows FROM table;",
      "keywords": ["SELECT", "AS", "FROM"],
      "operators": [],
      "punctuations": [";", "(", ")"],
      "functions": ["COUNT"],
      "columns": ["*"],
      "tables": ["table"],
      "constants": [],
      "others": []
    },
    {
      "id": 13,
      "query":
          "SELECT AVG(column1) FROM table GROUP BY column2 HAVING AVG(column1) > 10;",
      "keywords": ["SELECT", "FROM", "GROUP", "BY", "HAVING"],
      "operators": [">"],
      "punctuations": [";", "(", ")"],
      "functions": ["AVG"],
      "columns": ["column1", "column2"],
      "tables": ["table"],
      "constants": [10],
      "others": []
    },
    {
      "id": 14,
      "query":
          "SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id WHERE table1.column1 = 'value';",
      "keywords": ["SELECT", "FROM", "INNER", "JOIN", "ON", "WHERE"],
      "operators": ["="],
      "punctuations": [";"],
      "functions": [],
      "columns": ["*", "id", "column1"],
      "tables": ["table1", "table2"],
      "constants": ["value"],
      "others": ["table1.column1"]
    },
    {
      "id": 15,
      "query":
          "SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id WHERE table1.column1 = 'value';",
      "keywords": ["SELECT", "FROM", "INNER", "JOIN", "ON", "WHERE"],
      "operators": ["="],
      "punctuations": [";"],
      "functions": [],
      "columns": ["*", "id", "column1"],
      "tables": ["table1", "table2"],
      "constants": ["value"],
      "others": ["table1.column1"]
    },
    {
      "id": 16,
      "query":
          "SELECT MAX(column1) AS max_value FROM table WHERE column2 > 100 GROUP BY column3 HAVING COUNT(*) > 5 ORDER BY max_value DESC;",
      "keywords": [
        "SELECT",
        "AS",
        "FROM",
        "WHERE",
        "GROUP",
        "BY",
        "HAVING",
        "ORDER",
        "DESC"
      ],
      "operators": [">"],
      "punctuations": [";", "(", ")"],
      "functions": ["MAX", "COUNT"],
      "columns": ["column1", "column2", "column3", "*", "max_value"],
      "tables": ["table"],
      "constants": [100, 5],
      "others": []
    },
    {
      "id": 17,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 IS NOT NULL;",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "IS", "NOT", "NULL"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4"],
      "tables": ["table"],
      "constants": ["value"],
      "others": []
    },
    {
      "id": 18,
      "query": "SELECT * FROM customers ORDER BY customer_id DESC LIMIT 5;",
      "keywords": ["SELECT", "FROM", "ORDER", "BY", "DESC", "LIMIT"],
      "operators": [],
      "punctuations": [";"],
      "functions": [],
      "columns": ["*", "customer_id"],
      "tables": ["customers"],
      "constants": [5],
      "others": []
    },
    {
      "id": 19,
      "query":
          "SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.id WHERE table2.column3 IS NULL;",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "JOIN",
        "ON",
        "WHERE",
        "IS",
        "NULL"
      ],
      "operators": ["="],
      "punctuations": [";"],
      "functions": [],
      "columns": ["*", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": [],
      "others": ["table2.column3"]
    },
    {
      "id": 20,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 LIKE 'pattern%';",
      "keywords": ["SELECT", "FROM", "WHERE", "LIKE"],
      "operators": [],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": ["pattern%"],
      "others": []
    },
    {
      "id": 21,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 IN ('value1', 'value2', 'value3');",
      "keywords": ["SELECT", "FROM", "WHERE", "IN"],
      "operators": [],
      "punctuations": [",", ";", "(", ")"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": ["value1", "value2", "value3"],
      "others": []
    },
    {
      "id": 22,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 BETWEEN 10 AND 50;",
      "keywords": ["SELECT", "FROM", "WHERE", "BETWEEN", "AND"],
      "operators": [],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": [10, 50],
      "others": []
    },
    {
      "id": 23,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 NOT BETWEEN 10 AND 50 ORDER BY column1 ASC, column2 DESC;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "NOT",
        "BETWEEN",
        "AND",
        "ORDER",
        "BY",
        "ASC",
        "DESC"
      ],
      "operators": [],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": [10, 50],
      "others": []
    },
    {
      "id": 24,
      "query":
          "SELECT column1, column2 FROM table1 INNER JOIN table2 USING (id) WHERE table1.column3 = 'value';",
      "keywords": ["SELECT", "FROM", "INNER", "JOIN", "USING", "WHERE"],
      "operators": ["="],
      "punctuations": [",", ";", "(", ")"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": ["value"],
      "others": ["table1.column3"]
    },
    {
      "id": 25,
      "query":
          "SELECT column1, column2 FROM table1 LEFT JOIN table2 USING (id) WHERE table2.column3 IS NULL ORDER BY column1 ASC LIMIT 10;",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "JOIN",
        "USING",
        "WHERE",
        "IS",
        "NULL",
        "ORDER",
        "BY",
        "ASC",
        "LIMIT"
      ],
      "operators": [],
      "punctuations": [",", ";", "(", ")"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": [10],
      "others": ["table2.column3"]
    },
    {
      "id": 26,
      "query":
          "SELECT column1, column2 FROM table1 RIGHT JOIN table2 ON table1.id = table2.id WHERE table2.column3 = 'value';",
      "keywords": ["SELECT", "FROM", "RIGHT", "JOIN", "ON", "WHERE"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": ["value"],
      "others": ["table2.column3"]
    },
    {
      "id": 27,
      "query":
          "SELECT column1, column2 FROM table1 LEFT OUTER JOIN table2 ON table1.id = table2.id WHERE table1.column3 = 'value';",
      "keywords": ["SELECT", "FROM", "LEFT", "OUTER", "JOIN", "ON", "WHERE"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": ["value"],
      "others": ["table1.column3"]
    },
    {
      "id": 28,
      "query":
          "SELECT column1, column2 FROM table1 FULL OUTER JOIN table2 ON table1.id = table2.id WHERE table1.column3 = 'value';",
      "keywords": ["SELECT", "FROM", "FULL", "OUTER", "JOIN", "ON", "WHERE"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": ["value"],
      "others": ["table1.column3"]
    },
    {
      "id": 29,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' ORDER BY column2 ASC, column1 DESC LIMIT 20 OFFSET 10;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "ORDER",
        "BY",
        "ASC",
        "DESC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": ["value", 20, 10],
      "others": []
    },
    {
      "id": 30,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value1' OR column3 = 'value2';",
      "keywords": ["SELECT", "FROM", "WHERE", "OR"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": ["value1", "value2"],
      "others": []
    },
    {
      "id": 31,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND (column4 > 100 OR column5 IS NULL);",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "OR", "IS", "NULL"],
      "operators": ["=", ">"],
      "punctuations": [",", ";", "(", ")"],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4", "column5"],
      "tables": ["table"],
      "constants": ["value", 100],
      "others": []
    },
    {
      "id": 32,
      "query":
          "SELECT column1, COUNT(column2) AS count FROM table GROUP BY column1 HAVING count > 5 ORDER BY column1 ASC;",
      "keywords": [
        "SELECT",
        "AS",
        "FROM",
        "GROUP",
        "BY",
        "HAVING",
        "ORDER",
        "ASC"
      ],
      "operators": [">"],
      "punctuations": [",", ";", "(", ")"],
      "functions": ["COUNT"],
      "columns": ["column1", "count", "column2"],
      "tables": ["table"],
      "constants": [5],
      "others": []
    },
    {
      "id": 33,
      "query":
          "SELECT column1, column2 FROM table1 JOIN table2 USING (id) WHERE table1.column3 = 'value1' AND table2.column4 = 'value2';",
      "keywords": ["SELECT", "FROM", "JOIN", "USING", "WHERE", "AND"],
      "operators": ["="],
      "punctuations": [",", ";", "(", ")"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3", "column4"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2"],
      "others": ["table1.column3", "table2.column4"]
    },
    {
      "id": 34,
      "query":
          "SELECT column1, column2 FROM table1 JOIN table2 ON table1.id = table2.id AND table1.column3 = 'value1';",
      "keywords": ["SELECT", "FROM", "JOIN", "ON", "AND"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "id", "column3"],
      "tables": ["table1", "table2"],
      "constants": ["value1"],
      "others": ["table1.column3"]
    },
    {
      "id": 35,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 IN (SELECT column4 FROM table2 WHERE column5 = 'value');",
      "keywords": ["SELECT", "FROM", "WHERE", "IN"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4", "column5"],
      "tables": ["table", "table2"],
      "constants": ["value"],
      "others": []
    },
    {
      "id": 36,
      "query":
          "SELECT column1, column2 FROM table1 LEFT JOIN table2 ON table1.id = table2.id WHERE table1.column3 = 'value' AND (table2.column4 > 100 OR table2.column4 IS NULL);",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "JOIN",
        "ON",
        "WHERE",
        "AND",
        "OR",
        "IS",
        "NULL"
      ],
      "operators": ["=", "=", "="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value", 100],
      "others": ["table1.column3", "table2.column4"]
    },
    {
      "id": 37,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 LIKE 'pattern_' ESCAPE '!';",
      "keywords": ["SELECT", "FROM", "WHERE", "LIKE", "ESCAPE"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": ["pattern_", "!"],
      "others": []
    },
    {
      "id": 38,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND EXISTS (SELECT * FROM table2 WHERE table2.column4 = table.column4);",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "EXISTS"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": ["column1", "column2", "column3", "table.column4"],
      "tables": ["table", "table2"],
      "constants": ["value"],
      "others": ["table2.column4"]
    },
    {
      "id": 39,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 BETWEEN 'start' AND 'end';",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "BETWEEN", "AND"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4"],
      "tables": ["table"],
      "constants": ["value", "start", "end"],
      "others": []
    },
    {
      "id": 40,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 NOT BETWEEN 10 AND 20 ORDER BY column1 DESC LIMIT 5 OFFSET 2;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "NOT",
        "BETWEEN",
        "AND",
        "ORDER",
        "BY",
        "DESC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4"],
      "tables": ["table"],
      "constants": ["value", 10, 20, 5, 2],
      "others": []
    },
    {
      "id": 36,
      "query":
          "SELECT column1, column2 FROM table1 LEFT JOIN table2 ON table1.id = table2.id WHERE table1.column3 = 'value' AND (table2.column4 > 100 OR table2.column4 IS NULL);",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "JOIN",
        "ON",
        "WHERE",
        "AND",
        "OR",
        "IS",
        "NULL"
      ],
      "operators": ["=", "=", "="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value", 100],
      "others": ["table1.column3", "table2.column4"]
    },
    {
      "id": 37,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 LIKE 'pattern_' ESCAPE '!';",
      "keywords": ["SELECT", "FROM", "WHERE", "LIKE", "ESCAPE"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3"],
      "tables": ["table"],
      "constants": ["pattern_", "!"],
      "others": []
    },
    {
      "id": 38,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND EXISTS (SELECT * FROM table2 WHERE table2.column4 = table.column4);",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "EXISTS"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": ["column1", "column2", "column3", "table.column4"],
      "tables": ["table", "table2"],
      "constants": ["value"],
      "others": ["table2.column4"]
    },
    {
      "id": 39,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 BETWEEN 'start' AND 'end';",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "BETWEEN", "AND"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4"],
      "tables": ["table"],
      "constants": ["value", "start", "end"],
      "others": []
    },
    {
      "id": 40,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 NOT BETWEEN 10 AND 20 ORDER BY column1 DESC LIMIT 5 OFFSET 2;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "NOT",
        "BETWEEN",
        "AND",
        "ORDER",
        "BY",
        "DESC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4"],
      "tables": ["table"],
      "constants": ["value", 10, 20, 5, 2],
      "others": []
    },
    {
      "id": 46,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 NOT IN (SELECT column5 FROM table2 WHERE column6 = 'value');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "NOT", "IN"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value"],
      "others": []
    },
    {
      "id": 47,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND (column4 = 'value1' OR column5 IN (SELECT column6 FROM table2 WHERE column7 = 'value2'));",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "OR", "IN"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value1", "value2"],
      "others": []
    },
    {
      "id": 48,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND EXISTS (SELECT column4 FROM table2 WHERE column5 = 'value2' AND table.column6 = table2.column6);",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "EXISTS"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "table.column6",
        "table2.column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2"],
      "others": []
    },
    {
      "id": 49,
      "query":
          "SELECT column1, column2 FROM table1 RIGHT JOIN table2 ON table1.id = table2.id AND table1.column3 = 'value1' WHERE table2.column4 = 'value2';",
      "keywords": ["SELECT", "FROM", "RIGHT", "JOIN", "ON", "WHERE", "AND"],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2"],
      "others": ["table1.column3", "table2.column4"]
    },
    {
      "id": 50,
      "query":
          "SELECT column1, column2 FROM table1 LEFT OUTER JOIN table2 ON table1.id = table2.id AND (table1.column3 = 'value1' OR table2.column4 = 'value2');",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "OUTER",
        "JOIN",
        "ON",
        "AND",
        "OR"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2"],
      "others": ["table1.column3", "table2.column4"]
    },
    {
      "id": 51,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value1' AND (column4 = 'value2' OR column5 NOT IN (SELECT column6 FROM table2 WHERE column7 = 'value3'));",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "OR", "NOT", "IN"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7"
      ],
      "tables": ["table", "table2"],
      "constants": ["value1", "value2", "value3"],
      "others": []
    },
    {
      "id": 52,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 NOT EXISTS (SELECT column5 FROM table2 WHERE column6 = 'value2');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "NOT", "EXISTS"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2"],
      "others": []
    },
    {
      "id": 53,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value1' AND (column4 = 'value2' OR (column5 > 100 AND column6 LIKE 'pattern%'));",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "OR", "LIKE"],
      "operators": ["=", "=", ">", "AND"],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table"],
      "constants": ["value1", "value2", 100, "pattern%"],
      "others": []
    },
    {
      "id": 54,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT MAX(column5) FROM table2 WHERE column6 = 'value2');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": ["MAX"],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2"],
      "others": []
    },
    {
      "id": 55,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND (column4, column5) IN (SELECT column6, column7 FROM table2 WHERE column8 = 'value2');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "IN"],
      "operators": ["="],
      "punctuations": [",", ";", "(", ")"],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7",
        "column8"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2"],
      "others": []
    },
    {
      "id": 56,
      "query":
          "SELECT column1, column2 FROM table1 RIGHT JOIN table2 ON table1.id = table2.id AND (table1.column3 = 'value1' OR table2.column4 = 'value2') WHERE table2.column5 = 'value3';",
      "keywords": [
        "SELECT",
        "FROM",
        "RIGHT",
        "JOIN",
        "ON",
        "WHERE",
        "AND",
        "OR"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2", "value3"],
      "others": ["table1.column3", "table2.column4", "table2.column5"]
    },
    {
      "id": 57,
      "query":
          "SELECT column1, column2 FROM table1 LEFT OUTER JOIN table2 ON table1.id = table2.id AND (table1.column3 = 'value1' AND table2.column4 = 'value2') WHERE table1.column5 = 'value3';",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "OUTER",
        "JOIN",
        "ON",
        "WHERE",
        "AND"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2", "value3"],
      "others": ["table1.column3", "table1.column5", "table2.column4"]
    },
    {
      "id": 58,
      "query":
          "SELECT column1, column2 FROM table1 FULL OUTER JOIN table2 ON table1.id = table2.id AND (table1.column3 = 'value1' OR table2.column4 = 'value2') WHERE table2.column5 = 'value3';",
      "keywords": [
        "SELECT",
        "FROM",
        "FULL",
        "OUTER",
        "JOIN",
        "ON",
        "WHERE",
        "AND",
        "OR"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2", "value3"],
      "others": ["table1.column3", "table2.column4", "table2.column5"]
    },
    {
      "id": 59,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT column5 FROM table2 WHERE column6 = 'value2') AND column7 NOT IN (SELECT column8 FROM table3 WHERE column9 = 'value3');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "OR", "NOT", "IN"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7",
        "column8",
        "column9"
      ],
      "tables": ["table", "table2", "table3"],
      "constants": ["value", "value2", "value3"],
      "others": []
    },
    {
      "id": 60,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT TOP 1 column5 FROM table2 WHERE column6 = 'value2' ORDER BY column7 DESC) AND column8 LIKE 'pattern%';",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "TOP",
        "ORDER",
        "BY",
        "DESC",
        "LIKE"
      ],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7",
        "column8"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2", "pattern%"],
      "others": []
    },
    {
      "id": 61,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT DISTINCT column5 FROM table2 WHERE column6 = 'value2') AND column7 NOT LIKE 'pattern%';",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "DISTINCT", "LIKE"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2", "pattern%"],
      "others": []
    },
    {
      "id": 62,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value1' AND column4 = ANY (SELECT column5 FROM table2 WHERE column6 = 'value2');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "ANY"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value1", "value2"],
      "others": []
    },
    {
      "id": 63,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value1' AND column4 = SOME (SELECT column5 FROM table2 WHERE column6 = 'value2');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "SOME"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value1", "value2"],
      "others": []
    },
    {
      "id": 64,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value1' AND column4 = ALL (SELECT column5 FROM table2 WHERE column6 = 'value2');",
      "keywords": ["SELECT", "FROM", "WHERE", "AND", "ALL"],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6"
      ],
      "tables": ["table", "table2"],
      "constants": ["value1", "value2"],
      "others": []
    },
    {
      "id": 65,
      "query":
          "SELECT column1, column2 FROM table1 LEFT JOIN table2 ON table1.id = table2.id AND table1.column3 = 'value1' WHERE table2.column4 = 'value2' ORDER BY column1 DESC, column2 ASC LIMIT 5 OFFSET 2;",
      "keywords": [
        "SELECT",
        "FROM",
        "LEFT",
        "JOIN",
        "ON",
        "WHERE",
        "ORDER",
        "BY",
        "DESC",
        "ASC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["="],
      "punctuations": [",", ";"],
      "functions": [],
      "columns": ["column1", "column2"],
      "tables": ["table1", "table2"],
      "constants": ["value1", "value2", 5, 2],
      "others": ["table1.column3", "table2.column4"]
    },
    {
      "id": 66,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT column5 FROM table2 WHERE column6 = 'value2') AND column7 IN (SELECT column8 FROM table3 WHERE column9 = 'value3') ORDER BY column1 ASC, column2 DESC LIMIT 10 OFFSET 3;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "IN",
        "ORDER",
        "BY",
        "ASC",
        "DESC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["="],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7",
        "column8",
        "column9"
      ],
      "tables": ["table", "table2", "table3"],
      "constants": ["value", "value2", "value3", 10, 3],
      "others": []
    },
    {
      "id": 67,
      "query":
          "SELECT AVG(column1) AS average, SUM(column2) AS total FROM table WHERE column3 = 'value' GROUP BY column4 HAVING total > 100;",
      "keywords": [
        "SELECT",
        "AVG",
        "AS",
        "SUM",
        "FROM",
        "WHERE",
        "GROUP",
        "BY",
        "HAVING"
      ],
      "operators": [">"],
      "punctuations": [",", ";", "("],
      "functions": ["AVG", "SUM"],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "average",
        "total"
      ],
      "tables": ["table"],
      "constants": ["value", 100],
      "others": []
    },
    {
      "id": 68,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT column5 FROM table2 WHERE column6 = 'value2') AND (column7 > 50 OR column8 IS NOT NULL) ORDER BY column1 DESC, column2 ASC LIMIT 5 OFFSET 2;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "OR",
        "IS",
        "NOT",
        "NULL",
        "ORDER",
        "BY",
        "DESC",
        "ASC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["=", "=", ">", "OR"],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7",
        "column8"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2", 50, 5, 2],
      "others": []
    },
    {
      "id": 69,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 = (SELECT column5 FROM table2 WHERE column6 = 'value2') AND column7 BETWEEN 20 AND 30 ORDER BY column1 ASC, column2 DESC LIMIT 10 OFFSET 3;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "BETWEEN",
        "AND",
        "ORDER",
        "BY",
        "ASC",
        "DESC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["=", "=", "BETWEEN", "AND"],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": [
        "column1",
        "column2",
        "column3",
        "column4",
        "column5",
        "column6",
        "column7"
      ],
      "tables": ["table", "table2"],
      "constants": ["value", "value2", 20, 30, 10, 3],
      "others": []
    },
    {
      "id": 70,
      "query":
          "SELECT column1, column2 FROM table WHERE column3 = 'value' AND column4 NOT BETWEEN 10 AND 20 ORDER BY column1 DESC, column2 ASC LIMIT 5 OFFSET 2;",
      "keywords": [
        "SELECT",
        "FROM",
        "WHERE",
        "AND",
        "NOT",
        "BETWEEN",
        "AND",
        "ORDER",
        "BY",
        "DESC",
        "ASC",
        "LIMIT",
        "OFFSET"
      ],
      "operators": ["=", "=", "NOT", "BETWEEN", "AND"],
      "punctuations": [",", ";", "("],
      "functions": [],
      "columns": ["column1", "column2", "column3", "column4"],
      "tables": ["table"],
      "constants": ["value", 10, 20, 5, 2],
      "others": []
    },
  ];
}

// {
// "query": """""",
// "keywords": [],
// "operators": [],
// "punctuations": [],
// "functions": [],
// "columns": [],
// "tables": [],
// "others": [],
// }

class TestDataFields {
  String id = "id";
  String query = "query";
  String keywords = "keywords";
  String operators = "operators";
  String punctuations = "punctuations";
  String functions = "functions";
  String columns = "columns";
  String tables = "tables";
  String others = "others";
  String constants = "constants";
}
