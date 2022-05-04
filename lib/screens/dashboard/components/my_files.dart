import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/MyFiles.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding)),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: demoMyFiles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: defaultPadding,
              childAspectRatio: 1.4),
          itemBuilder: (context, index) => FileInfoCloud(
            info: demoMyFiles[index],
          ),
        ),
      ],
    );
  }
}

class FileInfoCloud extends StatelessWidget {
  final CloudStorageInfo info;
  const FileInfoCloud({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: info.color?.withOpacity(0.15),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: SvgPicture.asset(
                    info.svgSrc ?? "",
                    color: info.color,
                  ),
                ),
                const Icon(
                  Icons.more_vert,
                  color: Colors.white54,
                ),
              ],
            ),
            Text(
              info.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            ProgressLine(
              color: info.color ?? Colors.white,
              percentage: info.percentage ?? 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${info.numOfFiles} Files",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white70),
                ),
                Text(
                  "${info.totalStorage}",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white),
                ),
              ],
            )
          ]),
    );
  }
}

class ProgressLine extends StatelessWidget {
  final Color color;
  final int percentage;

  const ProgressLine({
    Key? key,
    required this.color,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        LayoutBuilder(
            builder: ((context, constraints) => Container(
                  width: constraints.maxWidth * (percentage / 100),
                  height: 5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )))
      ],
    );
  }
}
