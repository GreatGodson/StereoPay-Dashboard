import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/routing/routes.dart';

class CustomMenuController extends GetxController {
  static CustomMenuController instance = Get.find();
  var activeItem = overviewPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon('overview', itemName);
      case ticketsPageDisplayName:
        return _customIcon('ticket', itemName);
      case ideasPageDisplayName:
        return _customIcon('ideas', itemName);
      case contactsPageDisplayName:
        return _customIcon('contacts', itemName);
      case agentsPageDisplayName:
        return _customIcon('agents', itemName);
      case articlesPageDisplayName:
        return _customIcon('articles', itemName);
      case authenticationPageDisplayName:
        return _customIcon('settings', itemName);
      case settingsPageDisplayName:
        return _customIcon('settings', itemName);
      case subscriptionPageDisplayName:
        return _customIcon('subscription', itemName);
      default:
        return _customIcon('settings', itemName);
    }
  }

  // Widget _customIcon(IconData icon, String itemName) {
  //   if (isActive(itemName)) return Icon(icon, size: 22, color: dark);
  //
  //   return Icon(
  //     icon,
  //     color: isHovering(itemName) ? dark : lightGrey,
  //   );
  // }

  Widget _customIcon(String iconPath, String itemName) {
    if (isActive(itemName)) {
      return SvgPicture.asset(
        'assets/icons/$iconPath.svg',
        color: const Color(0XFFDDE2FF),
      );
    }

    return SvgPicture.asset(
      '$iconPath.svg',
      color: isHovering(itemName)
          ? const Color(0XFFDDE2FF)
          : const Color(0XFFDDE2FF),
    );
  }
}
