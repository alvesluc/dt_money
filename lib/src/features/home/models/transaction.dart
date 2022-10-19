import 'dart:convert';

enum TransactionType {
  income('income'),
  expense('expense');

  const TransactionType(this.value);
  final String value;
}

class TransactionModel {
  final String description;
  final double value;
  final String category;
  final TransactionType type;
  final DateTime entryDate;

  TransactionModel({
    required this.description,
    required this.value,
    required this.category,
    required this.type,
    required this.entryDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'value': value,
      'category': category,
      'type': type.value,
      'entryDate': entryDate.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      description: map['description'] as String,
      value: map['value'] as double,
      category: map['category'] as String,
      type: TransactionType.values.byName(map['type']),
      entryDate: DateTime.fromMillisecondsSinceEpoch(map['entryDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) {
    return TransactionModel.fromMap(
      json.decode(source) as Map<String, dynamic>,
    );
  }

  @override
  String toString() {
    return 'TransactionModel(description: $description, value: $value, category: $category, type: $type)';
  }
}
