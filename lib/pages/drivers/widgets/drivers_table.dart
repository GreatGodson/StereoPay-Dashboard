import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/core/services/authentication.dart';
import 'package:streopay_dashboard/pages/drivers/drivers.dart';
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
  AuthenticationService authenticationService = AuthenticationService();

  // static
  // List<Map>
  List steps = [];
  convertCustomTicketToMap({required List customTicket}) {
    for (Ticket customStep in customTicket) {
      Map step = customStep.toMap();
      debugPrint(step.toString());
      steps.add(step);
    }
    return steps;
  }

  // onTapFunc(){
  //   allTickets.add(Ticket(
  //       ticketDetails: 'house',
  //       customerName: 'great',
  //       date: 'new'));
  //
  //   var t = convertCustomTicketToMap(
  //       customTicket: allTickets);
  //
  //   authenticationService.createTicket(ticketData: t);
  // }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        // ignore: unrelated_type_equality_checks
        // if (snapshot.connectionState == true) {
        //   return CircularProgressIndicator(
        //     color: Colors.blue,
        //   );
        // }

        if (snapshot.connectionState == ConnectionState.waiting) {
          // While data is being loaded, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If an error occurs, show an error message.
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // If data is available, show the data in a UI.

          final ticketData = snapshot.data!.data();

          List allTickets = [];
          steps = ticketData?['tickets'];

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('All Tickets'),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => CurvedDialogBox(
                                allTickets: allTickets,
                                convertCustomTicketToMap:
                                    convertCustomTicketToMap,
                                authenticationService: authenticationService));
                      },
                      child: const Text('Add new tickets'))
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Ticket details',
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.lightTextColor),
                  ),
                  Text(
                    'Customer name',
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.lightTextColor),
                  ),
                  Text(
                    'Date',
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.lightTextColor),
                  ),
                  Text(
                    'Priority',
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.lightTextColor),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Divider(
                            // height: 30,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(steps[index]['ticketDetails']),
                                      Text(
                                        steps[index]['date'],
                                        style: GoogleFonts.mulish(
                                            color: AppColors.rowLightTextColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(steps[index]['customerName']),
                                  Text(
                                    steps[index]['date'],
                                    style: GoogleFonts.mulish(
                                        color: AppColors.rowLightTextColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(steps[index]['date']),
                                  Text(
                                    steps[index]['date'],
                                    style: GoogleFonts.mulish(
                                        color: AppColors.rowLightTextColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: steps[index]['priority'] ==
                                                "HIGH"
                                            ? AppColors.highPriorityColor
                                            : steps[index]['priority'] == "LOW"
                                                ? AppColors.lowPriorityColor
                                                : AppColors.normalPriorityColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      child: Text(
                                        steps[index]['priority'],
                                        style: GoogleFonts.mulish(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.whiteColor),
                                      )),
                                  // SizedBox(
                                  //   width: 24,
                                  // ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: const Icon(Icons.menu))
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          );
        } else {
          // If no data is available, show a message indicating that.
          return const Center(
              child: Text(
            'No tickets available',
            style: TextStyle(color: Colors.black),
          ));
        }
      },
    );
  }
}

enum Priority { HIGH, NORMAL, LOW }

class CurvedDialogBox extends StatefulWidget {
  final List allTickets;
  final dynamic convertCustomTicketToMap;
  final AuthenticationService authenticationService;

  CurvedDialogBox(
      {required this.allTickets,
      required this.convertCustomTicketToMap,
      required this.authenticationService});

  @override
  State<CurvedDialogBox> createState() => _CurvedDialogBoxState();
}

class _CurvedDialogBoxState extends State<CurvedDialogBox> {
  String customerName = '';

  String ticketDetails = '';

  Priority _selectedPriority = Priority.NORMAL;

  String priority = 'NORMAL';

  createTicket() {
    widget.allTickets.add(Ticket(
        ticketDetails: ticketDetails,
        customerName: customerName,
        date: 'new',
        priority: priority));

    var t = widget.convertCustomTicketToMap(customTicket: widget.allTickets);

    widget.authenticationService.createTicket(ticketData: t);
  }

// time
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 300,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Add new ticket'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (val) {
                      customerName = val.trim();
                    },
                    decoration: InputDecoration(
                        labelText: "Customer Name",
                        hintText: "Stereo Pay",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (val) {
                      ticketDetails = val.trim();
                    },
                    decoration: InputDecoration(
                        labelText: "Ticket details",
                        hintText: "Contact email not linked",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 200,
                    child: DropdownButton<Priority>(
                      value: _selectedPriority,
                      items: Priority.values.map((Priority priority) {
                        return DropdownMenuItem<Priority>(
                          value: priority,
                          child: Text(priority.toString()),
                        );
                      }).toList(),
                      onChanged: (Priority? newValue) {
                        setState(() {
                          _selectedPriority = newValue!;
                          if (_selectedPriority == Priority.HIGH) {
                            priority = "HIGH";
                          } else if (_selectedPriority == Priority.LOW) {
                            priority = "LOW";
                          } else {
                            priority = "NORMAL";
                          }
                        });
                      },
                    )),
                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (val) {
                      // email = val.trim();
                    },
                    decoration: InputDecoration(
                        labelText: "Email address",
                        hintText: "abc@domain.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                createTicket();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// DataTable2(
//   columnSpacing: 5,
//   horizontalMargin: 5,
//   minWidth: 600,
//   columns: const [
//     DataColumn2(
//       label: Text("Ticket details"),
//       size: ColumnSize.L,
//     ),
//     DataColumn(
//       label: Text('Customer name'),
//     ),
//     DataColumn(
//       label: Text('Date'),
//     ),
//     DataColumn(
//       label: Text('Priority'),
//     ),
//   ],
//   rows: [
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Contact Email not Linked',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Tom Cruise',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFF12B2C),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'HIGH',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Adding Images to Featured Posts',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Matt Damon',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFFEC400),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'LOW',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Payment not going through',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Christian Bale',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFF29CC97),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'NORMAL',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Contact Email not Linked',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Tom Cruise',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFF12B2C),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'HIGH',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Contact Email not Linked',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Tom Cruise',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFF12B2C),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'HIGH',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Adding Images to Featured Posts',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Matt Damon',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFFEC400),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'LOW',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Payment not going through',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Christian Bale',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFF29CC97),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'NORMAL',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Contact Email not Linked',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Tom Cruise',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFF12B2C),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'HIGH',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Adding Images to Featured Posts',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Matt Damon',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFFEC400),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'LOW',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Payment not going through',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Christian Bale',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFF29CC97),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'NORMAL',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Contact Email not Linked',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Tom Cruise',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFF12B2C),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'HIGH',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Adding Images to Featured Posts',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Matt Damon',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFFFEC400),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'LOW',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//     DataRow(cells: [
//       DataCell(Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset('assets/icons/circleAvatar.svg'),
//               const SizedBox(
//                 width: 7.5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Payment not going through',
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: AppColors.darkTextColor),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Updated 1 day ago",
//                     style: GoogleFonts.mulish(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12,
//                         color: AppColors.rowLightTextColor),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 26,
//               // ),
//             ],
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Christian Bale',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "on 24.05.2019",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'May 26, 2019',
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: AppColors.darkTextColor),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "6:30 PM",
//             style: GoogleFonts.mulish(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: AppColors.rowLightTextColor),
//           ),
//         ],
//       )),
//       DataCell(Container(
//           decoration: BoxDecoration(
//             color: const Color(0XFF29CC97),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           padding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: Text(
//             'NORMAL',
//             style: GoogleFonts.mulish(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.whiteColor),
//           ))),
//     ]),
//   ]);
