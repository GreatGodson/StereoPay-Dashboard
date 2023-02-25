import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/pages/overview/widgets/bar_chart.dart';
import 'package:streopay_dashboard/pages/overview/widgets/revenue_info.dart';
import 'package:streopay_dashboard/widgets/custom_text.dart';

class RevenueSectionLarge extends StatelessWidget {
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
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today’s trends",
                  style: GoogleFonts.mulish(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "as of 25 May 2019, 09:41 PM",
                  style: GoogleFonts.mulish(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightTextColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(width: 600, child: GraphView()),
              ],
            ),
          ),
          Container(
            height: 600,
            width: 1.5,
            color: AppColors.dividerColor,
          ),
          SizedBox(
            height: 500,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RevenueInfo(
                  title: "Resolved",
                  amount: "449",
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    height: 1.5,
                    width: 342,
                    color: AppColors.dividerColor,
                  ),
                ),
                RevenueInfo(
                  title: "Average first response time",
                  amount: "33m",
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    height: 1.5,
                    width: 342,
                    color: AppColors.dividerColor,
                  ),
                ),
                RevenueInfo(
                  title: "Average response time",
                  amount: "3h 8m",
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    height: 1.5,
                    width: 342,
                    color: AppColors.dividerColor,
                  ),
                ),
                RevenueInfo(
                  title: "Resolution within SLA",
                  amount: "94%",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
