import 'package:flutter/material.dart';
import 'package:streopay_dashboard/pages/clients/clients.dart';
import 'package:streopay_dashboard/pages/drivers/drivers.dart';
import 'package:streopay_dashboard/pages/overview/overview.dart';
import 'package:streopay_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ticketsPageRoute:
      return _getPageRoute(TicketPage());
    case ideasPageRoute:
      return _getPageRoute(IdeaPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
