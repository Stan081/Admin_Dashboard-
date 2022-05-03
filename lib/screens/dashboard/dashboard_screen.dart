import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(children: [
          Header(),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 1.5,
                                    vertical: defaultPadding)),
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            label: Text("Add New"),
                          )
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                flex: 2,
                child: StorageDetails(),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
