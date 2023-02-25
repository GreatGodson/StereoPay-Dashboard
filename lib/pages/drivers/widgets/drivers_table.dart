import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/widgets/custom_text.dart';

/// Example without datasource
class DriversTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: SizedBox(height: 620, child: RowTiles()),
    );
  }
}

class RowTiles extends StatelessWidget {
  RowTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 5,
        horizontalMargin: 5,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text("Ticket details"),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Customer name'),
          ),
          DataColumn(
            label: Text('Date'),
          ),
          DataColumn(
            label: Text('Priority'),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Email not Linked',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tom Cruise',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFF12B2C),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'HIGH',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adding Images to Featured Posts',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matt Damon',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFFEC400),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'LOW',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment not going through',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Christian Bale',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF29CC97),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'NORMAL',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Email not Linked',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tom Cruise',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFF12B2C),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'HIGH',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Email not Linked',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tom Cruise',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFF12B2C),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'HIGH',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adding Images to Featured Posts',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matt Damon',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFFEC400),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'LOW',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment not going through',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Christian Bale',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF29CC97),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'NORMAL',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Email not Linked',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tom Cruise',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFF12B2C),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'HIGH',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adding Images to Featured Posts',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matt Damon',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFFEC400),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'LOW',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment not going through',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Christian Bale',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF29CC97),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'NORMAL',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Email not Linked',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tom Cruise',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFF12B2C),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'HIGH',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adding Images to Featured Posts',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matt Damon',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFFEC400),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'LOW',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
          DataRow(cells: [
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circleAvatar.svg'),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment not going through',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.darkTextColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Updated 1 day ago",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.rowLightTextColor),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 26,
                    // ),
                  ],
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Christian Bale',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "on 24.05.2019",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'May 26, 2019',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.darkTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "6:30 PM",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.rowLightTextColor),
                ),
              ],
            )),
            DataCell(Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF29CC97),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'NORMAL',
                  style: GoogleFonts.mulish(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))),
          ]),
        ]);
  }
}
