import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/dashboard_provider.dart';
import 'expenses_card.dart';
import 'income_card.dart';
import 'total_balance_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardStore>().getDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<DashboardStore>();
    final state = store.value;

    if (state is SuccessDashboardState) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 920) {
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                transform: Matrix4.translationValues(0.0, -48.0, 0.0),
                width: 1120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: IncomeCard(
                        totalIncome: state.dashboard.totalIncome,
                        lastEntry: state.dashboard.lastIncomeDate,
                        isMobile: false,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: ExpensesCard(
                        totalExpenses: state.dashboard.totalExpenses,
                        lastEntry: state.dashboard.lastExpenseDate,
                        isMobile: false,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: TotalBalanceCard(
                        totalBalance: state.dashboard.totalBalance,
                        firstEntry: state.dashboard.firstEntry,
                        lastEntry: state.dashboard.lastEntry,
                        isMobile: false,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container(
            height: 150,
            transform: Matrix4.translationValues(0.0, -48.0, 0.0),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              children: [
                IncomeCard(
                  totalIncome: state.dashboard.totalIncome,
                  lastEntry: state.dashboard.lastIncomeDate,
                ),
                const SizedBox(width: 16),
                ExpensesCard(
                  totalExpenses: state.dashboard.totalExpenses,
                  lastEntry: state.dashboard.lastExpenseDate,
                ),
                const SizedBox(width: 16),
                TotalBalanceCard(
                  totalBalance: state.dashboard.totalBalance,
                  firstEntry: state.dashboard.firstEntry,
                  lastEntry: state.dashboard.lastEntry,
                ),
              ],
            ),
          );
        },
      );
    }
    return const _DefaultDashboard();
  }
}

class _DefaultDashboard extends StatelessWidget {
  const _DefaultDashboard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 920) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              transform: Matrix4.translationValues(0.0, -48.0, 0.0),
              width: 1120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    child: IncomeCard(totalIncome: 0, isMobile: false),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    child: ExpensesCard(totalExpenses: 0, isMobile: false),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    child: TotalBalanceCard(totalBalance: 0, isMobile: false),
                  ),
                ],
              ),
            ),
          );
        }
        return Container(
          height: 150,
          transform: Matrix4.translationValues(0.0, -48.0, 0.0),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            children: const [
              IncomeCard(totalIncome: 0),
              SizedBox(width: 16),
              ExpensesCard(totalExpenses: 0),
              SizedBox(width: 16),
              TotalBalanceCard(totalBalance: 0),
            ],
          ),
        );
      },
    );
  }
}
