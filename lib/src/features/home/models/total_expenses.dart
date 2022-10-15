class TotalExpensesModel {
  final double value;
  final DateTime lastEntryDate;

  TotalExpensesModel(
    this.value,
    this.lastEntryDate,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'lastEntryDate': lastEntryDate.millisecondsSinceEpoch,
    };
  }

  factory TotalExpensesModel.fromMap(Map<String, dynamic> map) {
    return TotalExpensesModel(
      map['value'] as double,
      DateTime.fromMillisecondsSinceEpoch(map['lastEntryDate'] as int),
    );
  }

  @override
  String toString() =>
      'TotalExpensesModel(value: $value, lastEntryDate: $lastEntryDate)';
}
