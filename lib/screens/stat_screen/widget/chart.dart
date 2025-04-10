import 'dart:math';

import 'package:expense_tracker/util/app_colors.dart';
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
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: tilesWidget

          )
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true,reservedSize: 48,getTitlesWidget: leftTile)
        ),
      ),
        borderData: FlBorderData(
            show: false
          ),
      gridData:  FlGridData(
        show: false
      ),
      barGroups: showingGroups()
    );
  }

  BarChartGroupData makeGroupData(int x, double y){
    return BarChartGroupData(
      x:x,
      barRods: [
      BarChartRodData(
        toY: y,
        width: 10,
        gradient: LinearGradient(colors: [
          CustomColors.primary,
          CustomColors.secondary,
          CustomColors.tertiary
        ], transform: GradientRotation(pi / 40)),
        backDrawRodData: BackgroundBarChartRodData(
            show: true, toY: 5, color: Colors.grey[200]),
      )
    ]
    );
  }

  List<BarChartGroupData>
      showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0: return makeGroupData(0, 2);
          case 1: return makeGroupData(1, 3);
          case 2: return makeGroupData(2, 2);
          case 3: return makeGroupData(3, 4.5);
          case 4: return makeGroupData(4, 3.8);
          case 5: return makeGroupData(5, 1.5);
          case 6: return makeGroupData(6, 4);
          case 7: return makeGroupData(7, 3.8);
          default: throw Error();
        }
  });

  Widget tilesWidget(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14);
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('01', style: style);
        break;
      case 1:
        text = const Text('02', style: style);
        break;
      case 2:
        text = const Text('03', style: style);
        break;
      case 3:
        text = const Text('04', style: style);
        break;
      case 4:
        text = const Text('05', style: style);
        break;
      case 5:
        text = const Text('06', style: style);
        break;
      case 6:
        text = const Text('07', style: style);
        break;
      case 7:
        text = const Text('09', style: style);
        break;
      default:
        text = const Text('', style: style);
    }

    return SideTitleWidget(
      space: 16,
      child: text,
      meta: meta, // Corrected parameter
    );
  }


  Widget leftTile(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14);
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('\$ 1k', style: style);
        break;
      case 1:
        text = const Text('\$ 2k', style: style);
        break;
      case 2:
        text = const Text('\$ 3k', style: style);
        break;
      case 3:
        text = const Text('\$ 4k', style: style);
        break;
      case 4:
        text = const Text('\$ 5k', style: style);
        break;

      default:
        text = Container();
    }

    return SideTitleWidget(
      space: 16,
      meta: meta,
      child: text, // Corrected parameter
    );
  }
}
