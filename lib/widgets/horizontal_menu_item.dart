import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/controllers/menu_controller.dart';

import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final void Function()? onTap;
  HorizontalMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  CustomMenuController menuController = CustomMenuController.instance;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? const Color(0XFF9FA2B4).withOpacity(0.08)
                  // lightGrey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 6,
                      height: 40,
                      color: dark,
                    ),
                  ),
                  SizedBox(width: _width / 88),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      color: menuController.isHovering(itemName)
                          ? const Color(0XFFDDE2FF)
                          : const Color(0XFFA4A6B3),
                    ))
                  else
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      color: const Color(0XFFDDE2FF),
                      size: 18,
                      weight: FontWeight.bold,
                    ))
                ],
              ),
            )));
  }
}
