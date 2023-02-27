import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streopay_dashboard/constants/controllers.dart';
import 'package:streopay_dashboard/core/services/authentication.dart';
import 'package:streopay_dashboard/helpers/responsiveness.dart';
import 'package:streopay_dashboard/pages/drivers/widgets/drivers_table.dart';
import 'package:streopay_dashboard/widgets/custom_text.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
        builder: (context, snapshot) {
          return Container(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: ResponsiveWidget.isSmallScreen(context)
                                  ? 56
                                  : 6),
                          child: GestureDetector(
                            onTap: () {
                              //
                              // print(allTickets);
                            },
                            child: CustomText(
                              text: menuController.activeItem.value,
                              size: 24,
                              weight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [DriversTable()],
                )),
              ],
            ),
          );
        });
  }
}

class Ticket {
  Ticket(
      {required this.ticketDetails,
      required this.customerName,
      required this.date,
      required this.priority});

  final String customerName;
  final String date;
  final String ticketDetails;
  final String priority;

  Map<String, dynamic> toMap() {
    return {
      "ticketDetails": ticketDetails,
      "customerName": customerName,
      "date": date,
      "priority": priority
    };
  }
}
