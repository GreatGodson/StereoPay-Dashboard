import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streopay_dashboard/constants/controllers.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/helpers/responsiveness.dart';
import 'package:streopay_dashboard/routing/routes.dart';
import 'package:streopay_dashboard/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.scaffoldBackgroundColor,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SvgPicture.asset("assets/icons/logo.svg"),
                    ),
                    Flexible(
                      child: Text(
                        "Danny Dribble",
                        style: GoogleFonts.mulish(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                            color: AppColors.brightTextColor),
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map(
                  (item) => SideMenuItem(
                      itemName: item.name,
                      onTap: () {
                        if (item.route == authenticationPageRoute) {
                          Get.offAllNamed(authenticationPageRoute);
                          menuController
                              .changeActiveItemTo(overviewPageDisplayName);
                        }
                        if (!menuController.isActive(item.name)) {
                          menuController.changeActiveItemTo(item.name);
                          if (ResponsiveWidget.isSmallScreen(context))
                            Get.back();
                          navigationController.navigateTo(item.route);
                        }
                      }),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
