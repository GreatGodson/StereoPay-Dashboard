import 'package:flutter/cupertino.dart';
import 'package:streopay_dashboard/constants/controllers.dart';
import 'package:streopay_dashboard/routing/router.dart';
import 'package:streopay_dashboard/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
