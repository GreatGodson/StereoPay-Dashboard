import 'package:flutter/material.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/pages/overview/widgets/bar_chart.dart';
import 'package:streopay_dashboard/pages/overview/widgets/revenue_info.dart';
import 'package:streopay_dashboard/widgets/custom_text.dart';

class RevenueSectionSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Today’s trends",
                  size: 20,
                  weight: FontWeight.bold,
                  color: lightGrey,
                ),
                Container(width: 600, height: 200, child: GraphView()),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: lightGrey,
          ),
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    RevenueInfo(
                      title: "Resolved",
                      amount: "449",
                    ),
                    RevenueInfo(
                      title: "Received",
                      amount: "426",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    RevenueInfo(
                      title: "Average first response time",
                      amount: "43m",
                    ),
                    RevenueInfo(
                      title: "Average response time",
                      amount: "3h 8m",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
