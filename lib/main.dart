
import 'package:dbminer_quotes_app/views/screens/Splashscreen.dart';
import 'package:dbminer_quotes_app/views/screens/fvt_screen.dart';
import 'package:dbminer_quotes_app/views/screens/quotes_details_page.dart';
import 'package:dbminer_quotes_app/views/screens/intro_screen.dart';
import 'package:dbminer_quotes_app/views/screens/quotes_list_page.dart';
import 'package:dbminer_quotes_app/views/screens/Category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'contoller/theme_controller.dart';

void main() async {
  await GetStorage.init();
  final ThemeController _themeController = Get.put(ThemeController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeController.themeMode.value,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/IntroPage",
          page: () => introscreen(),
        ),
        GetPage(
          name: "/Homepage",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/second",
          page: () => const second_page(),
        ),
        GetPage(
          name: "/edit",
          page: () => const Edit_page(),
        ),
        GetPage(
          name: "/FvtScreen",
          page: () => const FvtScreen(),
        ),
      ],
    ),
  );
}
