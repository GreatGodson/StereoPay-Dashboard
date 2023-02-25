import 'package:flutter/material.dart';
import 'package:streopay_dashboard/pages/overview/widgets/info_card.dart';

class OverviewCardsLargeScreen extends StatefulWidget {
  @override
  State<OverviewCardsLargeScreen> createState() =>
      _OverviewCardsLargeScreenState();
}

class _OverviewCardsLargeScreenState extends State<OverviewCardsLargeScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    bool isActive = false;
    Color textColor = Colors.red;
    return Row(
      children: [
        // GestureDetector(
        //     onTap: () {
        //       setState(() {
        //         textColor = Colors.green;
        //       });
        //     },
        //     child: CircleAvatar(
        //       backgroundColor: textColor,
        //     )),
        InfoCard(
          isActive: isActive,
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
          index: 1,
          title: "Overdue",
          value: "16",
          topColor: Colors.lightGreen,
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
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
          value: "34",
          onTap: () {},
        ),
      ],
    );
  }
}
