import 'package:dt_money/src/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/home_page.dart';
import 'providers/transactions_provider.dart';
import 'services/local_storage_service.dart';
import 'services/shared_preferences_service/shared_preferences_service.dart';
import 'shared/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalStorageService>(
          create: (_) => SharedPreferencesImpl(),
        ),
        Provider(
          create: (context) => TransactionsService(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionsStore(context.read()),
        ),
        Provider(
          create: (context) => DashboardService(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardStore(context.read()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: const HomePage(),
      ),
    );
    // return TransactionsProvider(
    //   notifier: TransactionsStore(TransactionsService(SharedPreferencesImpl())),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
    //     darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
    //     home: const HomePage(),
    //   ),
    // );
  }
}
