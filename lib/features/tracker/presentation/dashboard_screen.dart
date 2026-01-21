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
    double initialamount = 0.00;
    return SafeArea(
      bottom: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                        'Latest Transactions', style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                ListView.builder(itemBuilder: (context, index) {
                  return Column(
                    children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(

                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue.shade100,
                            child: Icon(Icons.shopping_cart, color: Colors.blue.shade700,),
                          ),
                          title: Text('Grocery Shopping', style: textTheme.bodyMedium,),
                          subtitle: Text(DateFormat.yMMMd().format(DateTime.now()), style: textTheme.labelSmall,),
                          trailing: Text('- \#45.00', style: textTheme.bodyMedium?.copyWith(color: Colors.red),),
                  tileColor: Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                        ),
              ),

                    ],
                  );
                }, itemCount: 5, shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                )],
            ),
          ),
        ),
      ),
    );
  }
}
