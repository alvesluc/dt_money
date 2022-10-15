class TotalIncomeModel {
  final double value;
  final DateTime lastEntryDate;

  TotalIncomeModel(
    this.value,
    this.lastEntryDate,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'lastEntryDate': lastEntryDate.millisecondsSinceEpoch,
    };
  }

  factory TotalIncomeModel.fromMap(Map<String, dynamic> map) {
    return TotalIncomeModel(
      map['value'] as double,
      DateTime.fromMillisecondsSinceEpoch(map['lastEntryDate'] as int),
    );
  }

  @override
  String toString() =>
      'TotalIncomeModel(value: $value, lastEntryDate: $lastEntryDate)';
}
