import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:urgent2k/core/Theme/text_theme.dart';
import 'package:urgent2k/features/tracker/widget/bottom_navbar.dart';
import 'package:urgent2k/features/tracker/widget/mini_tab_bar.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.darkTextTheme;
    String currencyFormat = '#';
    var initialamount = 0;
    return SafeArea(
      bottom: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back,', style: textTheme.bodyMedium),
                      Text('Dashboard', style: textTheme.displayLarge),
                    ],
                  ),
                ],
              ),
              Card(
                surfaceTintColor: Colors.black,
                color: Colors.blue.shade900,
                elevation: 10,

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Amount Spent', style: textTheme.titleMedium),
                      const SizedBox(height: 10),
                      Text(
                        '$currencyFormat $initialamount ',
                        style: textTheme.displayLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.blue.shade700,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Spending Overview', style: textTheme.titleMedium),
                  )
                ],
              ),
              SizedBox(height: 20,),
              MiniTabCard(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'latest Transactions', style: textTheme.titleMedium,
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
