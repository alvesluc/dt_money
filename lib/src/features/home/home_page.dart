import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/colors.dart';
import 'models/total_balance.dart';
import 'models/total_expenses.dart';
import 'models/total_income.dart';
import 'widgets/dashboard.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/made_with_love.dart';
import 'widgets/search_transactions.dart';
import 'widgets/transactions_header.dart';
import 'widgets/transactions_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final totalIncome = TotalIncomeModel(17400, DateTime.now());
  final totalExpenses = TotalExpensesModel(1259, DateTime.now());
  final totalBalance = TotalBalanceModel(16141, DateTime.now(), DateTime.now());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: AppColors.gray2,
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.only(),
        children: [
          const HomeAppBar(),
          Dashboard(
            totalIncome: totalIncome,
            totalExpenses: totalExpenses,
            totalBalance: totalBalance,
          ),
          const TransactionsHeader(),
          const SearchTransactions(),
          const TransactionsList(),
          const SizedBox(height: 8),
          const MadeWithLoveByAlvesLuc()
        ],
      ),
    );
  }
}
