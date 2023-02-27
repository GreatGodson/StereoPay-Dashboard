import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/controllers/menu_controller.dart';
import 'package:streopay_dashboard/controllers/navigation_controller.dart';
import 'package:streopay_dashboard/firebase_options.dart';
import 'package:streopay_dashboard/layout.dart';
import 'package:get/get.dart';
import 'package:streopay_dashboard/pages/404/error.dart';
import 'package:streopay_dashboard/pages/authentication/authentication.dart';
import 'package:streopay_dashboard/pages/authentication/register.dart';
import 'package:streopay_dashboard/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CustomMenuController());
  Get.put(NavigationController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: authenticationPageRoute,
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(
            name: authenticationPageRoute, page: () => AuthenticationPage()),
        GetPage(name: registerPageRoute, page: () => RegisterPage())
      ],
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      // home: AuthenticationPage(),
    );
  }
}
