import 'dart:convert';

import 'package:dt_money/src/features/home/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionModel', () {
    test('should set transaction from stored json', () {
      final transaction = TransactionModel.fromMap(jsonDecode(transactionJson));

      expect(transaction.description, 'Something');
      expect(transaction.value, 1);
      expect(transaction.category, 'sunt');
      expect(transaction.type, TransactionType.income);
    });

    test('should set transactions from stored json', () {
      final list = jsonDecode(transactionsJson);
      
      final transactions = <TransactionModel>[];

      for (var e in list) { 
        transactions.add(TransactionModel.fromMap(e));
      }

      expect(transactions[0].description, 'Something');
      expect(transactions[0].value, 1);
      expect(transactions[0].category, 'sunt');
      expect(transactions[0].type, TransactionType.income);

      expect(transactions[1].description, 'Something else');
      expect(transactions[1].value, 1);
      expect(transactions[1].category, 'sunt');
      expect(transactions[1].type, TransactionType.expense);
    });
  });
}

const transactionsJson = """
[
  {
    "description": "Something",
    "value": 1,
    "category": "sunt",
    "type": "income"
  },
  {
    "description": "Something else",
    "value": 1,
    "category": "sunt",
    "type": "expense"
  }
]
""";

const transactionJson = """
{
    "description": "Something",
    "value": 1,
    "category": "sunt",
    "type": "income"
  }
""";
