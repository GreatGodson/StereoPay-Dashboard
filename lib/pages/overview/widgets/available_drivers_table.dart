import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/widgets/custom_text.dart';

/// Example without datasource
class AvailableDriversTable extends StatefulWidget {
  @override
  State<AvailableDriversTable> createState() => _AvailableDriversTableState();
}

class _AvailableDriversTableState extends State<AvailableDriversTable> {
  String _selectedValue = 'Finish ticket update';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: active.withOpacity(.4), width: .5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: lightGrey.withOpacity(.1),
                    blurRadius: 12)
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Unresolved tickets",
                        style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: AppColors.darkTextColor),
                      ),
                      Text(
                        "View Details",
                        style: GoogleFonts.mulish(
                            color: const Color(0XFF3751FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Group: Support",
                    style: GoogleFonts.mulish(
                        color: AppColors.lightTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                const ListTile(
                  title: Text('Waiting on Feature Request'),
                  trailing: Text('4238'),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.dividerColor,
                  height: 1.5,
                ),
                const ListTile(
                  title: Text('Awaiting Customer Response'),
                  trailing: Text('1005'),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.dividerColor,
                  height: 1.5,
                ),
                const ListTile(
                  title: Text('Awaiting Developer Fix'),
                  trailing: Text('914'),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.dividerColor,
                  height: 1.5,
                ),
                const ListTile(
                  title: Text('Pending'),
                  trailing: Text('281'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: active.withOpacity(.4), width: .5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: lightGrey.withOpacity(.1),
                    blurRadius: 12)
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tasks",
                        style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: AppColors.darkTextColor),
                      ),
                      Text(
                        "View all",
                        style: GoogleFonts.mulish(
                            color: const Color(0XFF3751FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Today",
                    style: GoogleFonts.mulish(
                        color: AppColors.lightTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                RadioListTile<String>(
                  value: 'Finish ticket update',
                  groupValue: _selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Finish ticket update'),
                  secondary: Container(
                    width: 74,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0XFFFEC400),
                    ),
                    child: Center(
                      child: Text(
                        'URGENT',
                        style: GoogleFonts.mulish(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: 'Create new ticket example',
                  groupValue: _selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Create new ticket example'),
                  secondary: Container(
                    width: 54,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0XFF29CC97),
                    ),
                    child: Center(
                      child: Text(
                        'NEW',
                        style: GoogleFonts.mulish(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: 'Update ticket report',
                  groupValue: _selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Update ticket report'),
                  secondary: Container(
                    width: 74,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0XFFF0F1F7),
                    ),
                    child: Center(
                      child: Text(
                        'DEFAULT',
                        style: GoogleFonts.mulish(
                          color: const Color(0XFF9FA2B4),
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    //
    //   Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     border: Border.all(color: active.withOpacity(.4), width: .5),
    //     boxShadow: [
    //       BoxShadow(
    //           offset: Offset(0, 6),
    //           color: lightGrey.withOpacity(.1),
    //           blurRadius: 12)
    //     ],
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   padding: const EdgeInsets.all(16),
    //   margin: EdgeInsets.only(bottom: 30),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Row(
    //         children: [
    //           SizedBox(
    //             width: 10,
    //           ),
    //           CustomText(
    //             text: "Available Drivers",
    //             color: lightGrey,
    //             weight: FontWeight.bold,
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 620,
    //         child: DataTable2(
    //             columnSpacing: 12,
    //             horizontalMargin: 12,
    //             minWidth: 600,
    //             columns: [
    //               DataColumn2(
    //                 label: Text("Name"),
    //                 size: ColumnSize.L,
    //               ),
    //               DataColumn(
    //                 label: Text('Location'),
    //               ),
    //               DataColumn(
    //                 label: Text('Rating'),
    //               ),
    //               DataColumn(
    //                 label: Text('Action'),
    //               ),
    //             ],
    //             rows: List<DataRow>.generate(
    //                 7,
    //                 (index) => DataRow(cells: [
    //                       DataCell(CustomText(text: "Santos Enoque")),
    //                       DataCell(CustomText(text: "New yourk city")),
    //                       DataCell(Row(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           Icon(
    //                             Icons.star,
    //                             color: Colors.deepOrange,
    //                             size: 18,
    //                           ),
    //                           SizedBox(
    //                             width: 5,
    //                           ),
    //                           CustomText(
    //                             text: "4.5",
    //                           )
    //                         ],
    //                       )),
    //                       DataCell(Container(
    //                           decoration: BoxDecoration(
    //                             color: light,
    //                             borderRadius: BorderRadius.circular(20),
    //                             border: Border.all(color: active, width: .5),
    //                           ),
    //                           padding: EdgeInsets.symmetric(
    //                               horizontal: 12, vertical: 6),
    //                           child: CustomText(
    //                             text: "Assign Delivery",
    //                             color: active.withOpacity(.7),
    //                             weight: FontWeight.bold,
    //                           ))),
    //                     ]))),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class AvailableDriversSmallTable extends StatefulWidget {
  @override
  State<AvailableDriversSmallTable> createState() =>
      _AvailableDriversSmallTableState();
}

class _AvailableDriversSmallTableState
    extends State<AvailableDriversSmallTable> {
  String _selectedValue = 'Finish ticket update';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Unresolved tickets",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: AppColors.darkTextColor),
                    ),
                    Text(
                      "View Details",
                      style: GoogleFonts.mulish(
                          color: const Color(0XFF3751FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "Group: Support",
                  style: GoogleFonts.mulish(
                      color: AppColors.lightTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const ListTile(
                title: Text('Waiting on Feature Request'),
                trailing: Text('4238'),
              ),
              Container(
                width: double.infinity,
                color: AppColors.dividerColor,
                height: 1.5,
              ),
              const ListTile(
                title: Text('Awaiting Customer Response'),
                trailing: Text('1005'),
              ),
              Container(
                // width: double.infinity,
                color: AppColors.dividerColor,
                height: 1.5,
              ),
              const ListTile(
                title: Text('Awaiting Developer Fix'),
                trailing: Text('914'),
              ),
              Container(
                // width: double.infinity,
                color: AppColors.dividerColor,
                height: 1.5,
              ),
              const ListTile(
                title: Text('Pending'),
                trailing: Text('281'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tasks",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: AppColors.darkTextColor),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.mulish(
                          color: const Color(0XFF3751FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "Today",
                  style: GoogleFonts.mulish(
                      color: AppColors.lightTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              RadioListTile<String>(
                value: 'Finish ticket update',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Finish ticket update'),
                secondary: Container(
                  width: 74,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0XFFFEC400),
                  ),
                  child: Center(
                    child: Text(
                      'URGENT',
                      style: GoogleFonts.mulish(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
              RadioListTile<String>(
                value: 'Create new ticket example',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Create new ticket example'),
                secondary: Container(
                  width: 54,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0XFF29CC97),
                  ),
                  child: Center(
                    child: Text(
                      'NEW',
                      style: GoogleFonts.mulish(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
              RadioListTile<String>(
                value: 'Update ticket report',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Update ticket report'),
                secondary: Container(
                  width: 74,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0XFFF0F1F7),
                  ),
                  child: Center(
                    child: Text(
                      'DEFAULT',
                      style: GoogleFonts.mulish(
                        color: const Color(0XFF9FA2B4),
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    //
    //   Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     border: Border.all(color: active.withOpacity(.4), width: .5),
    //     boxShadow: [
    //       BoxShadow(
    //           offset: Offset(0, 6),
    //           color: lightGrey.withOpacity(.1),
    //           blurRadius: 12)
    //     ],
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   padding: const EdgeInsets.all(16),
    //   margin: EdgeInsets.only(bottom: 30),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Row(
    //         children: [
    //           SizedBox(
    //             width: 10,
    //           ),
    //           CustomText(
    //             text: "Available Drivers",
    //             color: lightGrey,
    //             weight: FontWeight.bold,
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 620,
    //         child: DataTable2(
    //             columnSpacing: 12,
    //             horizontalMargin: 12,
    //             minWidth: 600,
    //             columns: [
    //               DataColumn2(
    //                 label: Text("Name"),
    //                 size: ColumnSize.L,
    //               ),
    //               DataColumn(
    //                 label: Text('Location'),
    //               ),
    //               DataColumn(
    //                 label: Text('Rating'),
    //               ),
    //               DataColumn(
    //                 label: Text('Action'),
    //               ),
    //             ],
    //             rows: List<DataRow>.generate(
    //                 7,
    //                 (index) => DataRow(cells: [
    //                       DataCell(CustomText(text: "Santos Enoque")),
    //                       DataCell(CustomText(text: "New yourk city")),
    //                       DataCell(Row(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           Icon(
    //                             Icons.star,
    //                             color: Colors.deepOrange,
    //                             size: 18,
    //                           ),
    //                           SizedBox(
    //                             width: 5,
    //                           ),
    //                           CustomText(
    //                             text: "4.5",
    //                           )
    //                         ],
    //                       )),
    //                       DataCell(Container(
    //                           decoration: BoxDecoration(
    //                             color: light,
    //                             borderRadius: BorderRadius.circular(20),
    //                             border: Border.all(color: active, width: .5),
    //                           ),
    //                           padding: EdgeInsets.symmetric(
    //                               horizontal: 12, vertical: 6),
    //                           child: CustomText(
    //                             text: "Assign Delivery",
    //                             color: active.withOpacity(.7),
    //                             weight: FontWeight.bold,
    //                           ))),
    //                     ]))),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// /// Example without a datasource
// class DataTable2SimpleDemo extends StatelessWidget {
//   const DataTable2SimpleDemo();
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 700,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: DataTable2(
//             columnSpacing: 12,
//             horizontalMargin: 12,
//             minWidth: 600,
//             columns: [
//               DataColumn2(
//                 label: Text('Column A'),
//                 size: ColumnSize.L,
//               ),
//               DataColumn(
//                 label: Text('Column B'),
//               ),
//               DataColumn(
//                 label: Text('Column C'),
//               ),
//               DataColumn(
//                 label: Text('Column D'),
//               ),
//               DataColumn(
//                 label: Text('Column NUMBERS'),
//                 numeric: true,
//               ),
//             ],
//             rows: List<DataRow>.generate(
//                 100,
//                 (index) => DataRow(cells: [
//                       DataCell(Text('A' * (10 - index % 10))),
//                       DataCell(Text('B' * (10 - (index + 5) % 10))),
//                       DataCell(Text('C' * (15 - (index + 5) % 10))),
//                       DataCell(Text('D' * (15 - (index + 10) % 10))),
//                       DataCell(Text(((index + 0.1) * 25.4).toString()))
//                     ]))),
//       ),
//     );
//   }
// }
