import 'package:flutter/material.dart';
import 'package:streopay_dashboard/pages/overview/widgets/info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
//   @override
//   State<OverviewCardsMediumScreen> createState() =>
//       _OverviewCardsMediumScreenState();
// }

// class _OverviewCardsMediumScreenState extends State<OverviewCardsMediumScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              index: 0,
              title: "Unresolved",
              value: "60",
              onTap: () {},
              topColor: Colors.orange,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Overdue",
              value: "16",
              topColor: Colors.lightGreen,
              index: 1,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            InfoCard(
              index: 2,
              title: "Open",
              value: "43",
              topColor: Colors.redAccent,
              onTap: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              index: 3,
              title: "On hold",
              value: "64",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
