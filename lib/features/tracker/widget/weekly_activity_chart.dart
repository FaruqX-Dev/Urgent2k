import 'package:flutter/material.dart';

class EditableWeeklyChart extends StatefulWidget {
  const EditableWeeklyChart({super.key});

  @override
  State<EditableWeeklyChart> createState() => _EditableWeeklyChartState();
}

class _EditableWeeklyChartState extends State<EditableWeeklyChart> {
  // 1. Data Source: Activity levels from 0.0 to 1.0 (percentage of height)
  List<double> weeklyActivity = [0.2, 0.5, 0.8, 0.4, 0.9, 0.3, 0.6];
  final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  // 2. Function to update activity (can be called from anywhere)
  void updateActivity(int dayIndex, double newValue) {
    setState(() {
      weeklyActivity[dayIndex] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end, // Aligns bars to bottom
            children: List.generate(weeklyActivity.length, (index) {
              return _buildBar(days[index], weeklyActivity[index]);
            }),
          ),
        ),
        const SizedBox(height: 20),
        // Example Button to simulate an activity update
        ElevatedButton(
          onPressed: () => updateActivity(2, 1.0), // Set Wednesday to Max
          child: const Text("Set Wed to 100%"),
        )
      ],
    );
  }

  Widget _buildBar(String label, double percentage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // The animated bar
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: 14,
          height: 120 * percentage, // 120 is the max height of the bars
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}