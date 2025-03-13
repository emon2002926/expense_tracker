import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      barChartData()
    );
  }

  BarChartData barChartData(){
    return BarChartData(

      titlesData: FlTitlesData(

        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
      )
    );
  }
}
