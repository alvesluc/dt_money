class TotalBalanceModel {
  final double value;
  final DateTime periodicityStart;
  final DateTime periodicityEnd;

  TotalBalanceModel(
    this.value,
    this.periodicityStart,
    this.periodicityEnd,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'periodicityStart': periodicityStart.millisecondsSinceEpoch,
      'periodicityEnd': periodicityEnd.millisecondsSinceEpoch,
    };
  }

  factory TotalBalanceModel.fromMap(Map<String, dynamic> map) {
    return TotalBalanceModel(
      map['value'] as double,
      DateTime.fromMillisecondsSinceEpoch(map['periodicityStart'] as int),
      DateTime.fromMillisecondsSinceEpoch(map['periodicityEnd'] as int),
    );
  }

  @override
  String toString() =>
      'TotalBalanceModel(value: $value, periodicityStart: $periodicityStart, periodicityEnd: $periodicityEnd)';
}
