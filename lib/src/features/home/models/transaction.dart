enum TransactionType { income, expense }

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

  @override
  String toString() {
    return 'TransactionModel(description: $description, value: $value, category: $category, type: $type)';
  }
}
