import 'package:flutter/material.dart';
import 'package:urgent2k/features/tracker/widget/weekly_activity_chart.dart';

class MiniTabCard extends StatefulWidget {
  @override
  _MiniTabCardState createState() => _MiniTabCardState();
}

class _MiniTabCardState extends State<MiniTabCard> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['Week', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Row(
          children: List.generate(_tabs.length, (index) {
            bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 16),
        // 2. The Content Card
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 150,
            child: _buildTabContent(_selectedIndex),
          ),
        ),
      ],
    );
  }

  // Logic to switch card content
  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return WeeklyExpenseChart(transactions: [],);
      case 1:
        return Text("Technical Details: Specs and documentation.");
      case 2:
        return Text("Usage Stats: 85% efficiency recorded.");
      default:
        return Text("Selection Error");
    }
  }
}