import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/model/transaction_model.dart'; // Add intl to your pubspec.yaml for date formatting

class WeeklyExpenseChart extends StatelessWidget {
  final List<TransactionModel> transactions;

  const WeeklyExpenseChart({super.key, required this.transactions});

  // 1. Logic to calculate daily totals
  double _calculateDayTotal(int weekday) {
    DateTime now = DateTime.now();

    // Find the most recent Monday to start the week
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime targetDate = startOfWeek.add(Duration(days: weekday - 1));

    return transactions
        .where((t) =>
    t.type == TransactionType.expense &&
        t.timestamp.day == targetDate.day &&
        t.timestamp.month == targetDate.month &&
        t.timestamp.year == targetDate.year)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    // 2. Find max total to scale the bars
    List<double> dailyTotals = List.generate(7, (index) => _calculateDayTotal(index + 1));
    double maxTotal = dailyTotals.reduce((a, b) => a > b ? a : b);
    if (maxTotal == 0) maxTotal = 1.0; // Avoid division by zero

    return Card(
      elevation: 0,
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (index) {
                final double dayAmount = dailyTotals[index];
                final double barRatio = dayAmount / maxTotal;
                final String dayLabel = _getDayName(index + 1);

                return Column(
                  children: [
                    // Tooltip-style text showing amount
                    if (dayAmount > 0)
                      Text('\$${dayAmount.toStringAsFixed(0)}',
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 12,
                      height: 100 * barRatio, // Max height of 100
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(dayLabel, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'M';
      case 2: return 'T';
      case 3: return 'W';
      case 4: return 'T';
      case 5: return 'F';
      case 6: return 'S';
      case 7: return 'S';
      default: return '';
    }
  }
}