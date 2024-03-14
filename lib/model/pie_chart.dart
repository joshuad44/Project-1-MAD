import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPieChart extends StatelessWidget {
  MyPieChart(
    {Key? key,
    required this.value1,
    required this.value2,
    required this.value3})
     : super(key: key);

  num value1;
  num value2;
  num value3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: PieChart(
        swapAnimationDuration: const Duration(seconds: 1),
        PieChartData(sections: [
          PieChartSectionData(
            badgeWidget: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black, 
                borderRadius: BorderRadius.circular(30.0), 
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              padding: const EdgeInsets.only(left: 20, right: 20), 
              child: 
              Column(
                children: [
                  Text(
                    'Fats',
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    value1.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            showTitle: false,
            badgePositionPercentageOffset: 1,
            value: value1.toDouble(),
            color: Colors.yellow.shade400,
          ),
          PieChartSectionData(
            badgeWidget: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black, 
                borderRadius: BorderRadius.circular(30.0), 
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              padding: const EdgeInsets.only(left: 20, right: 20), 
              child: 
              Column(
                children: [
                  Text(
                    'Carbs',
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    value2.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            showTitle: false,
            badgePositionPercentageOffset: 1,
            value: value2.toDouble(),
            color: Colors.yellow.shade500,
          ),
          PieChartSectionData(
            badgeWidget: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black, 
                borderRadius: BorderRadius.circular(30.0), 
                border: Border.all(color: Colors.white, width: 2.0),
              ),
              padding: const EdgeInsets.only(left: 20, right: 20), 
              child: 
              Column(
                children: [
                  Text(
                    'Protein',
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    value3.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            showTitle: false,
            badgePositionPercentageOffset: 1,
            value: value3.toDouble(),
            color: Colors.yellow.shade600,
          ),
        ]),
      ),
    );
  }
}