enum TransactionType { income, expense }

class TransactionModel {
  final String description;
  final double price;
  final String tag;
  final TransactionType type;

  TransactionModel({
    required this.description,
    required this.price,
    required this.tag,
    required this.type,
  });

  @override
  String toString() {
    return 'TransactionModel(description: $description, price: $price, tag: $tag, type: $type)';
  }
}
