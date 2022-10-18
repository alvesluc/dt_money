import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  TransactionModel({
    required this.description,
    required this.value,
    required this.category,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'value': value,
      'category': category,
      'type': type.value,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      description: map['description'],
      value: map['value'].toDouble(),
      category: map['category'],
      type: TransactionType.values.byName(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) {
    return TransactionModel.fromMap(
      json.decode(source) as Map<String, dynamic>,
    );
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.value == value &&
        other.category == category &&
        other.type == type;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        value.hashCode ^
        category.hashCode ^
        type.hashCode;
  }

  @override
  String toString() {
    return 'TransactionModel(description: $description, value: $value, category: $category, type: $type)';
  }
}
