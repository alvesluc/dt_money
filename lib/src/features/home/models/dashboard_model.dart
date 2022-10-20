// ignore_for_file: public_member_api_docs, sort_constructors_first
class DashboardModel {
  final double totalIncome;
  final DateTime? lastIncomeDate;
  final double totalExpenses;
  final DateTime? lastExpenseDate;
  final double totalBalance;
  final DateTime? firstEntry;
  final DateTime? lastEntry;

  DashboardModel(
    this.totalIncome,
    this.lastIncomeDate,
    this.totalExpenses,
    this.lastExpenseDate,
    this.totalBalance,
    this.firstEntry,
    this.lastEntry,
  );

  @override
  String toString() {
    return 'DashboardModel(totalIncome: $totalIncome, lastIncomeDate: $lastIncomeDate, totalExpenses: $totalExpenses, lastExpenseDate: $lastExpenseDate, totalBalance: $totalBalance, firstEntry: $firstEntry, lastEntry: $lastEntry)';
  }
}
