import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartSelectionData = [
      PieChartSectionData(
          color: primaryColor, value: 25, showTitle: false, radius: 25),
      PieChartSectionData(
          color: Color(0xFF26E5FF), value: 20, showTitle: false, radius: 20),
      PieChartSectionData(
          color: Color(0xFFFFCF26), value: 10, showTitle: false, radius: 19),
      PieChartSectionData(
          color: Color(0xFFEE2727), value: 15, showTitle: false, radius: 16),
      PieChartSectionData(
          color: primaryColor.withOpacity(0.1),
          value: 25,
          showTitle: false,
          radius: 13),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(children: [
          Header(),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  height: 500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(children: [
                    const Text(
                      "Storage Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          PieChart(
                            PieChartData(
                                sectionsSpace: 0,
                                startDegreeOffset: -90,
                                centerSpaceRadius: 70,
                                sections: pieChartSelectionData),
                          ),
                          Positioned.fill(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "29.1",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        height: 0.5),
                              ),
                              Text("of 128GB")
                            ],
                          ))
                        ],
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
