import 'package:flutter/material.dart';
import 'package:responsive_dashboard/screens/dashboard/components/chart.dart';
import 'package:responsive_dashboard/screens/dashboard/components/storage_info_card.dart';

import '../../../constants.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Storage Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Chart(pieChartSelectionData: pieChartSelectionData),
        const StorageInfoCard(
          title: "Document Files",
          svgSrc: "assets/icons/Documents.svg",
          amountOfFiles: "1.3GB",
          numOfFiles: 1329,
        ),
        const StorageInfoCard(
          title: "Media Files",
          svgSrc: "assets/icons/media.svg",
          amountOfFiles: "15.3GB",
          numOfFiles: 1329,
        ),
        const StorageInfoCard(
          title: "Other Files",
          svgSrc: "assets/icons/folder.svg",
          amountOfFiles: "1.3GB",
          numOfFiles: 1328,
        ),
        const StorageInfoCard(
          title: "Unknown ",
          svgSrc: "assets/icons/unknown.svg",
          amountOfFiles: "1.3GB",
          numOfFiles: 140,
        )
      ]),
    );
  }
}
