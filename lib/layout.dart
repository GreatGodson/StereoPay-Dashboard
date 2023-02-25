import 'package:flutter/material.dart';
import 'package:streopay_dashboard/helpers/responsiveness.dart';
import 'package:streopay_dashboard/widgets/large_screen.dart';
import 'package:streopay_dashboard/widgets/side_menu.dart';
import 'package:streopay_dashboard/widgets/small_screen.dart';
import 'package:streopay_dashboard/widgets/top_nav_bar.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: topNavigationBar(context, scaffoldKey),
        drawer: const Drawer(
          child: SideMenu(),
        ),
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
